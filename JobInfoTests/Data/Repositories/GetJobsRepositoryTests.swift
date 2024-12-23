//
//  GetJobsRepositoryTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Testing
@testable import JobInfo

struct GetJobsRepositoryTests {
    
    @Test func test_getJobs_returns_success_jobs() async throws {
        // GIVEN
        let apiGetJobsStub = APIGetJobsDataSourceStub()
        let expectedJobsResult = JobResultDTO(count: 10, next: "nextResult", previous: "previousResult", results: [])
        apiGetJobsStub.jobs = expectedJobsResult
        let sut = GetJobsRepository(apiDataSource: apiGetJobsStub,
                                    errorMapper: JobInfoDomainErrorMapper(),
                                    jobsResultMapper: JobsResultMapper())
        
        // WHEN
        let capturedJobsResult = try await sut.getJobs(filterID: 1, filterType: .byRegion)
        
        // THEN
        #expect(capturedJobsResult.count == expectedJobsResult.count)
        #expect(capturedJobsResult.next == expectedJobsResult.next)
        #expect(capturedJobsResult.previous == expectedJobsResult.previous)
        #expect(capturedJobsResult.results.count == expectedJobsResult.results.count)
        
    }
    
    @Test func test_getJobs_returns_failure_when_getJobsDataSource_fails() async throws {
        // GIVEN
        let apiGetJobsStub = APIGetJobsDataSourceStub()
        apiGetJobsStub.isSuccess = false
        let sut = GetJobsRepository(apiDataSource: apiGetJobsStub,
                                    errorMapper: JobInfoDomainErrorMapper(),
                                    jobsResultMapper: JobsResultMapper())
        
        // WHEN
        do {
            _ = try await sut.getJobs(filterID: 1, filterType: .byRegion)
            
            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == JobInfoDomainError.generic)
        }
    }
    
    
}
