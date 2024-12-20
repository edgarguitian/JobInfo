//
//  URLSessionRequestMakerTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Testing
@testable import JobInfo

struct URLSessionRequestMakerTests {

    @Test func test_urlRequest_success_get() async throws {
        // GIVEN
        let endpoint = Endpoint(path: "/test", queryParameters: ["param": "value"], body: nil, method: .get)

        let baseURL = "https://example.com"

        // WHEN
        let request = URLSessionRequestMaker().urlRequest(endpoint: endpoint, baseUrl: baseURL)

        // THEN
        #expect(request != nil)
        #expect(request?.httpMethod == "GET")
        #expect(request?.url?.absoluteString == "https://example.com/test?param=value")
    }
    
    @Test func test_urlRequest_success_post_not_nil_body_nil_queryParameters() {
        // GIVEN
        let endpoint = Endpoint(path: "/test", queryParameters: [:], body: ["key": "value"], method: .post)

        let baseURL = "https://example.com"

        // WHEN
        let request = URLSessionRequestMaker().urlRequest(endpoint: endpoint, baseUrl: baseURL)

        // THEN
        #expect(request != nil)
        #expect(request?.httpMethod == "POST")
        #expect(request?.url?.absoluteString == "https://example.com/test?")
        #expect(request?.value(forHTTPHeaderField: "Content-Type") == "application/json")
        #expect(request?.httpBody == "{\"key\":\"value\"}".data(using: .utf8))
    }

    @Test func test_urlRequest_success_post_nil_body_not_nil_queryParameters() {
        // GIVEN
        let endpoint = Endpoint(path: "/test", queryParameters: ["key": "value"], body: nil, method: .post)

        let baseURL = "https://example.com"

        // WHEN
        let request = URLSessionRequestMaker().urlRequest(endpoint: endpoint, baseUrl: baseURL)

        // THEN
        #expect(request != nil)
        #expect(request?.httpMethod == "POST")
        #expect(request?.url?.absoluteString == "https://example.com/test?key=value")
        #expect(request?.httpBody == nil)
    }

    @Test func test_urlRequest_fail_when_url_is_invalid() {
        // GIVEN
        let endpoint = Endpoint(path: "/test", queryParameters: ["param": "value"], body: nil, method: .get)

        let baseURL = ""

        // WHEN
        let request = URLSessionRequestMaker().urlRequest(endpoint: endpoint, baseUrl: baseURL)

        // THEN
        #expect(request == nil)
    }

}
