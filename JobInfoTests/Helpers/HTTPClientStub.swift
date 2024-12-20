//
//  HTTPClientStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation
@testable import JobInfo

final class HTTPClientStub: HTTPClient {
    var isSuccess = true
    var data: Data?

    func makeRequest(endpoint: Endpoint, baseUrl: String) async throws(HTTPClientError) -> Data {
        if isSuccess {
            return data!
        }
        throw HTTPClientError.generic
    }
}

