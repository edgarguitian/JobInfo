//
//  HTTPClientError.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

enum HTTPClientError: Error {
    case clientError
    case serverError
    case generic
    case parsingError
    case badURL
    case responseError
    case tooManyRequests
}
