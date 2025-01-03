//
//  APIGetJobsDataSourceTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Testing
@testable import JobInfo

struct APIGetJobsDataSourceTests {
    
    @Test func tests_getJobs_return_success_when_httpclient_request_success_and_response_is_correct() async throws {
        // GIVEN
        let data = """
                {
                    "count": 10,
                    "next": "nextResult",
                    "previous": "previousResult",
                    "results": []
                }
        """.data(using: .utf8)
        
        let httpClientStub = HTTPClientStub()
        httpClientStub.data = data
        let sut = APIGetJobsDataSource(httpClient: httpClientStub)
        let expectedJobsResult = JobResultDTO(count: 10, next: "nextResult", previous: "previousResult", results: [])
        
        // WHEN
        let capturedJobsByRegionResult = try await sut.getJobs(filterID: 1, filterType: .byRegion)
        
        // THEN
        #expect(capturedJobsByRegionResult.count == expectedJobsResult.count)
        #expect(capturedJobsByRegionResult.next == expectedJobsResult.next)
        #expect(capturedJobsByRegionResult.previous == expectedJobsResult.previous)
        #expect(capturedJobsByRegionResult.results.count == expectedJobsResult.results.count)
    }
    
    @Test func tests_getJobs_fails_when_httpclient_request_fail() async throws {
        // GIVEN
        let httpClientStub = HTTPClientStub()
        httpClientStub.isSuccess = false
        let sut = APIGetJobsDataSource(httpClient: httpClientStub)
        
        // WHEN
        do {
            _ = try await sut.getJobs(filterID: 1, filterType: .byRegion)
            
            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == HTTPClientError.generic)
        }
    }
    
    @Test func tests_getJobsByRegion_fails_when_httpclient_request_sucess_and_response_is_not_correct() async throws {
        // GIVEN
        let data = "".data(using: .utf8)
        let httpClientStub = HTTPClientStub()
        httpClientStub.data = data
        let sut = APIGetJobsDataSource(httpClient: httpClientStub)
        
        // WHEN
        do {
            _ = try await sut.getJobs(filterID: 1, filterType: .byRegion)
            
            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == HTTPClientError.parsingError)
        }
    }
    
    
}
