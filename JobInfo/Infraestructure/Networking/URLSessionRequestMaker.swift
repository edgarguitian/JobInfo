//
//  URLSessionRequestMaker.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

class URLSessionRequestMaker {

    func urlRequest(endpoint: Endpoint, baseUrl: String) -> URLRequest? {
        // URL
        guard let url = URL(string: baseUrl) else {
            print("Endpoint URL is invalid")
            return nil
        }

        // URL Components
        var urlComponents = URLComponents(string: baseUrl + endpoint.path)
        //urlComponents?.path = endpoint.path
        urlComponents?.queryItems = endpoint.queryParameters.map { URLQueryItem(name: $0.key, value: "\($0.value)")}

        guard let finalURL = urlComponents?.url else {
            print("Endpoint path or query items are invalid")
            return nil
        }
        // Request
        var request = URLRequest(url: finalURL)

        // Method
        request.httpMethod = endpoint.method.rawValue
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        if endpoint.method == .post && endpoint.body != nil {
            
            request.httpBody = try? JSONSerialization.data(withJSONObject: endpoint.body!, options: .sortedKeys)
        }

        return request
    }
}
