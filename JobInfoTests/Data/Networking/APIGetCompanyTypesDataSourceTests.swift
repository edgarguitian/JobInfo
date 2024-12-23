//
//  APIGetCompanyTypesDataSourceTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Testing
@testable import JobInfo

struct APIGetCompanyTypesDataSourceTests {

    @Test func tests_getCompanyTypes_return_success_when_httpclient_request_success_and_response_is_correct() async throws {
        // GIVEN
        let data = """
            [
                {
                    "id": 1,
                    "name": "CompanyType1"
                },
                {
                    "id": 2,
                    "name": "CompanyType2"
                }
            ]
        """.data(using: .utf8)

        let httpClientStub = HTTPClientStub()
        httpClientStub.data = data
        let sut = APIGetCompanyTypesDataSource(httpClient: httpClientStub)
        let expectedCompanyTypes = [CompanyTypeDTO(id: 1, name: "CompanyType1"), CompanyTypeDTO(id: 2, name: "CompanyType2")]

        // WHEN
        let capturedCompanyTypesResult = try await sut.getCompanyTypes()

        // THEN
        #expect(capturedCompanyTypesResult == expectedCompanyTypes)
    }
    
    @Test func tests_getCompanyTypes_fails_when_httpclient_request_fail() async throws {
        // GIVEN
        let httpClientStub = HTTPClientStub()
        httpClientStub.isSuccess = false
        let sut = APIGetCompanyTypesDataSource(httpClient: httpClientStub)

        // WHEN
        do {
            _ = try await sut.getCompanyTypes()

            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == HTTPClientError.generic)
        }
    }
    
    @Test func tests_getCompanyTypes_fails_when_httpclient_request_sucess_and_response_is_not_correct() async throws {
        // GIVEN
        let data = "".data(using: .utf8)
        let httpClientStub = HTTPClientStub()
        httpClientStub.data = data
        let sut = APIGetCompanyTypesDataSource(httpClient: httpClientStub)

        // WHEN
        do {
            _ = try await sut.getCompanyTypes()

            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == HTTPClientError.parsingError)
        }
    }

}


