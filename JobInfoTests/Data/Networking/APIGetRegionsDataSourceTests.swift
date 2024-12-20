//
//  APIGetRegionsDataSourceTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Testing
@testable import JobInfo
struct APIGetRegionsDataSourceTests {

    @Test func tests_getRegions_return_success_when_httpclient_request_success_and_response_is_correct() async throws {
        // GIVEN
        let data = """
            [
                {
                    "id": 1,
                    "name": "Region1"
                },
                {
                    "id": 2,
                    "name": "Region2"
                }
            ]
        """.data(using: .utf8)

        let httpClientStub = HTTPClientStub()
        httpClientStub.data = data
        let sut = APIGetRegionsDataSource(httpClient: httpClientStub)
        let expectedRegions = [JobRegionDTO(id: 1, name: "Region1"), JobRegionDTO(id: 2, name: "Region2")]

        // WHEN
        let capturedRegionsResult = try await sut.getRegions()

        // THEN
        #expect(capturedRegionsResult == expectedRegions)
    }
    
    @Test func tests_getRegions_fails_when_httpclient_request_fail() async throws {
        // GIVEN
        let httpClientStub = HTTPClientStub()
        httpClientStub.isSuccess = false
        let sut = APIGetRegionsDataSource(httpClient: httpClientStub)

        // WHEN
        do {
            _ = try await sut.getRegions()

            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == HTTPClientError.generic)
        }
    }
    
    @Test func tests_getRegions_fails_when_httpclient_request_sucess_and_response_is_not_correct() async throws {
        // GIVEN
        let data = "".data(using: .utf8)
        let httpClientStub = HTTPClientStub()
        httpClientStub.data = data
        let sut = APIGetRegionsDataSource(httpClient: httpClientStub)

        // WHEN
        do {
            _ = try await sut.getRegions()

            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == HTTPClientError.parsingError)
        }
    }

}
