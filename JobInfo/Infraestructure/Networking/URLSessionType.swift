//
//  URLSessionType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

protocol URLSessionType {
    func data(for url: URLRequest) async throws -> (Data?, URLResponse?)
}
