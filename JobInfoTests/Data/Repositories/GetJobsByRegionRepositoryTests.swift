//
//  GetJobsByRegionRepositoryTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Testing
@testable import JobInfo

struct GetJobsByRegionRepositoryTests {

    @Test func test_getJobsByRegion_returns_success_jobs() async throws {
        // GIVEN
        let apiGetJobsByRegionStub = APIGetJobsByRegionDataSourceStub()
        let expectedJobsResult = JobResultDTO(count: 10, next: "nextResult", previous: "previousResult", results: [])
        apiGetJobsByRegionStub.jobs = expectedJobsResult
        let sut = GetJobsByRegionRepository(apiDataSource: apiGetJobsByRegionStub,
                                            errorMapper: JobInfoDomainErrorMapper(),
                                            jobsByRegionResultMapper: JobsByRegionResultMapper())

        // WHEN
        let capturedJobsResult = try await sut.getJobsByRegion(regionId: 1, currentPage: 1)

        // THEN
        #expect(capturedJobsResult.count == expectedJobsResult.count)
        #expect(capturedJobsResult.next == expectedJobsResult.next)
        #expect(capturedJobsResult.previous == expectedJobsResult.previous)
        #expect(capturedJobsResult.results.count == expectedJobsResult.results.count)

    }

    @Test func test_getJobsByRegion_returns_failure_when_getJobsByRegionDataSource_fails() async throws {
        // GIVEN
        let apiGetJobsByRegionStub = APIGetJobsByRegionDataSourceStub()
        apiGetJobsByRegionStub.isSuccess = false
        let sut = GetJobsByRegionRepository(apiDataSource: apiGetJobsByRegionStub,
                                            errorMapper: JobInfoDomainErrorMapper(),
                                            jobsByRegionResultMapper: JobsByRegionResultMapper())

        // WHEN
        do {
            _ = try await sut.getJobsByRegion(regionId: 1, currentPage: 1)

            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == JobInfoDomainError.generic)
        }
    }


}
