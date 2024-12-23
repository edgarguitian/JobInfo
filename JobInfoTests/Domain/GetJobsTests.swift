//
//  GetJobsTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Testing
@testable import JobInfo

struct GetJobsTests {
    
    @Test func test_execute_sucesfully_returns_jobs() async throws {
        // GIVEN
        let stub = GetJobsRepositoryStub()
        let expectedJobResult = JobResult(count: 10, next: "nextUrl", previous: "previousUrl", results: [])
        stub.jobs = expectedJobResult
        let sut = GetJobs(repository: stub)
        
        // WHEN
        let capturedJobResult = try await sut.execute(filterID: 1, filterType: .byRegion)
        
        // THEN
        #expect(capturedJobResult.count == expectedJobResult.count)
        #expect(capturedJobResult.next == expectedJobResult.next)
        #expect(capturedJobResult.previous == expectedJobResult.previous)
        #expect(capturedJobResult.results.count == expectedJobResult.results.count)
        
    }
    
    @Test func test_execute_returns_error_when_repository_returns_error() async throws {
        // GIVEN
        let stub = GetJobsRepositoryStub()
        stub.isSuccess = false
        let sut = GetJobs(repository: stub)
        
        // WHEN
        do {
            _ = try await sut.execute(filterID: 1, filterType: .byRegion)
            
            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == JobInfoDomainError.generic)
        }
    }
    
}
