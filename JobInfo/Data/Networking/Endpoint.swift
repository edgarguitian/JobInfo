//
//  Endpoint.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

struct Endpoint {
    let path: String
    let queryParameters: [String: Any]
    let body: [String: Any]?
    let method: HTTPMethod
}
