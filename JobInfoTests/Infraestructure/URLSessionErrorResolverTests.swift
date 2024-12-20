//
//  URLSessionErrorResolverTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Testing
@testable import JobInfo
import Foundation

class URLSessionErrorResolverTests {

    var errorResolver: URLSessionErrorResolver!

    init() {
        errorResolver = URLSessionErrorResolver()
    }

    deinit {
        errorResolver = nil
    }

    @Test func test_resolve_statusCode_tooManyRequests() {
        #expect(errorResolver.resolve(statusCode: 429) == .tooManyRequests)
    }

    @Test func test_resolve_statusCode_clientError() {
        #expect(errorResolver.resolve(statusCode: 400) == .clientError)
        #expect(errorResolver.resolve(statusCode: 404) == .clientError)
    }

    @Test func test_resolve_statusCode_serverError() {
        #expect(errorResolver.resolve(statusCode: 500) == .serverError)
        #expect(errorResolver.resolve(statusCode: 503) == .serverError)
    }

    @Test func test_resolve_error_generic() {
        #expect(errorResolver.resolve(error: NSError(domain: "TestDomain", code: 100, userInfo: nil)) == .generic)
    }

}
