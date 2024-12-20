//
//  GetRegionsTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Testing
@testable import JobInfo
struct GetRegionsTests {

    @Test func test_execute_sucesfully_returns_regions() async throws {
        // GIVEN
        let stub = GetRegionsRepositoryStub()
        let expectedRegions = [JobRegion(id: 1, name: "Region1"), JobRegion(id: 2, name: "Region2")]
        stub.regions = expectedRegions
        let sut = GetRegions(repository: stub)
        
        // WHEN
        let capturedRegionsResult = try await sut.execute()
        
        // THEN
        #expect(capturedRegionsResult == expectedRegions)
    }
    
    @Test func test_execute_returns_error_when_repository_returns_error() async throws {
        // GIVEN
        let stub = GetRegionsRepositoryStub()
        stub.isSuccess = false
        let sut = GetRegions(repository: stub)
        
        // WHEN
        do {
            _ = try await sut.execute()

            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == JobInfoDomainError.generic)
        }
    }

}
