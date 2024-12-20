//
//  SharedURLSession.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

class SharedURLSession: URLSessionType {
    func data(for url: URLRequest) async throws -> (Data?, URLResponse?) {
        do {
            let config = URLSessionConfiguration.default
            config.waitsForConnectivity = true
            config.allowsCellularAccess = true
            config.timeoutIntervalForResource = 30

            let session = URLSession(configuration: config)

            let (data, response) = try await session.data(for: url)
            return (data, response)
        } catch {
            if let url = url.url {
                firebaseLogs.setCustomValue(url.absoluteString, forKey: "Url")
            }
            firebaseLogs.sendRecord(message: "Error_SharedURLSession",
                                    description: error.localizedDescription)
            return (nil, nil)
        }
    }
}
