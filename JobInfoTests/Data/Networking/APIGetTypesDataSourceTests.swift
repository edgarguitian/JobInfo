//
//  APIGetTypesDataSourceTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Testing
@testable import JobInfo

struct APIGetTypesDataSourceTests {

    @Test func tests_getTypes_return_success_when_httpclient_request_success_and_response_is_correct() async throws {
        // GIVEN
        let data = """
            [
                {
                    "id": 1,
                    "name": "Type1"
                },
                {
                    "id": 2,
                    "name": "Type2"
                }
            ]
        """.data(using: .utf8)

        let httpClientStub = HTTPClientStub()
        httpClientStub.data = data
        let sut = APIGetTypesDataSource(httpClient: httpClientStub)
        let expectedTypes = [JobTypeDTO(id: 1, name: "Type1"), JobTypeDTO(id: 2, name: "Type2")]

        // WHEN
        let capturedTypesResult = try await sut.getTypes()

        // THEN
        #expect(capturedTypesResult == expectedTypes)
    }
    
    @Test func tests_getTypes_fails_when_httpclient_request_fail() async throws {
        // GIVEN
        let httpClientStub = HTTPClientStub()
        httpClientStub.isSuccess = false
        let sut = APIGetTypesDataSource(httpClient: httpClientStub)

        // WHEN
        do {
            _ = try await sut.getTypes()

            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == HTTPClientError.generic)
        }
    }
    
    @Test func tests_getTypes_fails_when_httpclient_request_sucess_and_response_is_not_correct() async throws {
        // GIVEN
        let data = "".data(using: .utf8)
        let httpClientStub = HTTPClientStub()
        httpClientStub.data = data
        let sut = APIGetTypesDataSource(httpClient: httpClientStub)

        // WHEN
        do {
            _ = try await sut.getTypes()

            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == HTTPClientError.parsingError)
        }
    }

}

