//
//  URLSessionHTTPClientTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Testing
@testable import JobInfo
import Foundation

class URLSessionHTTPClientTests {

    var httpClient: URLSessionHTTPCLient!
    var urlSession: URLSessionStub!
    var mockRequestMaker: URLSessionRequestMaker!
    var errorResolver: URLSessionErrorResolver!
    var responseData: Data!
    
    init() {
        urlSession = URLSessionStub()
        mockRequestMaker = URLSessionRequestMaker()
        errorResolver = URLSessionErrorResolver()
        httpClient = URLSessionHTTPCLient(session: urlSession,
                                          requestMaker: mockRequestMaker,
                                          errorResolver: errorResolver)
    }
    
    deinit {
        urlSession = nil
        mockRequestMaker = nil
        errorResolver = nil
        httpClient = nil
    }
    
    @Test func test_makeRequest_success() async throws {
        // GIVEN
        let endpoint = Endpoint(path: "/test", queryParameters: ["param": "value"], body: nil, method: .get)
        let baseURL = "https://example.com"
        responseData = "Response Data".data(using: .utf8)!
        urlSession.dataStub = responseData

        // WHEN
        let capturedSessionResult = try await httpClient.makeRequest(endpoint: endpoint, baseUrl: baseURL)

        // THEN
        #expect(capturedSessionResult == responseData)
    }

    @Test func test_makeRequest_failure_clientError() async throws {
        // GIVEN
        let endpoint = Endpoint(path: "/test", queryParameters: ["param": "value"], body: nil, method: .get)
        let baseURL = "https://example.com"

        // WHEN
        do {
            _ = try await httpClient.makeRequest(endpoint: endpoint, baseUrl: baseURL)
            
            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == .clientError)
        }
    }

    @Test func test_makeRequest_failure_generic() async throws {
        // GIVEN
        let endpoint = Endpoint(path: "/test", queryParameters: ["param": "value"], body: nil, method: .get)
        let baseURL = "https://example.com"
        urlSession.errorStub = NSError(domain: "TestDomain", code: 100, userInfo: nil)

        // WHEN
        do {
            _ = try await httpClient.makeRequest(endpoint: endpoint, baseUrl: baseURL)
            
            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == .generic)
        }
    }


}
