//
//  GetRegionsRepositoryTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Testing
@testable import JobInfo

struct GetRegionsRepositoryTests {

    @Test func test_getRegions_returns_success_regions() async throws {
        // GIVEN
        let apiGetRegionsStub = APIGetRegionsDataSourceStub()
        let expectedRegions = [JobRegionDTO(id: 1, name: "Region1"), JobRegionDTO(id: 2, name: "Region2")]
        apiGetRegionsStub.regions = expectedRegions
        let sut = GetRegionsRepository(apiDataSource: apiGetRegionsStub,
                                       errorMapper: JobInfoDomainErrorMapper(),
                                       regionsResultMapper: RegionsResultMapper())
        
        // WHEN
        let capturedRegionsResult = try await sut.getRegions()
        
        // THEN
        #expect(capturedRegionsResult.count == expectedRegions.count)
        #expect(capturedRegionsResult.first!.name == expectedRegions.first!.name)
        #expect(capturedRegionsResult.first!.id == expectedRegions.first!.id)
        #expect(capturedRegionsResult.last!.id == expectedRegions.last!.id)
        #expect(capturedRegionsResult.last!.name == expectedRegions.last!.name)

    }
    
    @Test func test_getRegions_returns_failure_when_getRegionsDataSource_fails() async throws {
        // GIVEN
        let apiGetRegionsStub = APIGetRegionsDataSourceStub()
        apiGetRegionsStub.isSuccess = false
        let sut = GetRegionsRepository(apiDataSource: apiGetRegionsStub,
                                       errorMapper: JobInfoDomainErrorMapper(),
                                       regionsResultMapper: RegionsResultMapper())
        
        // WHEN
        do {
            _ = try await sut.getRegions()

            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == JobInfoDomainError.generic)
        }
    }

}
