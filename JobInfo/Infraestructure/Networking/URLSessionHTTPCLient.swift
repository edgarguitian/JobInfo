//
//  URLSessionHTTPCLient.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

class URLSessionHTTPCLient: HTTPClient {
    private let session: URLSessionType
    private let requestMaker: URLSessionRequestMaker
    private let errorResolver: URLSessionErrorResolver

    init(session: URLSessionType = SharedURLSession(),
         requestMaker: URLSessionRequestMaker, errorResolver: URLSessionErrorResolver) {
        self.session = session
        self.requestMaker = requestMaker
        self.errorResolver = errorResolver
    }

    func makeRequest(endpoint: Endpoint, baseUrl: String) async throws(HTTPClientError) -> Data {
        guard let url = requestMaker.urlRequest(endpoint: endpoint, baseUrl: baseUrl) else {
            setCrashlyticsParams(path: endpoint.path, baseUrl: baseUrl)
            firebaseLogs.sendRecord(message: "Error_MakeRequest_Url_Nil",
                                    description: baseUrl+endpoint.path)
            throw HTTPClientError.badURL
        }

        do {
            let resultSession = try await session.data(for: url)
            guard let resultData = resultSession.0 else {
                setCrashlyticsParams(path: endpoint.path, baseUrl: baseUrl)
                firebaseLogs.sendRecord(message: "Error_MakeRequest_Url_Data_Nil",
                                        description: baseUrl+endpoint.path)
                throw HTTPClientError.badURL
            }
            let responseString = String(decoding: resultData, as: UTF8.self)

            guard let response = resultSession.1 as? HTTPURLResponse else {
                setCrashlyticsParams(path: endpoint.path, baseUrl: baseUrl)
                firebaseLogs.sendRecord(message: "Error_MakeRequest_Response",
                                        description: responseString)
                throw HTTPClientError.responseError
            }

            guard response.statusCode == 200 else {
                throw errorResolver.resolve(statusCode: response.statusCode)
            }

            debug(request: url, response: (resultData, response))

            return resultData

        } catch let error as HTTPClientError {
            throw error
        } catch {
            throw errorResolver.resolve(error: error)
        }
    }

    private func setCrashlyticsParams(path: String?, baseUrl: String?) {
        if let path = path {
            firebaseLogs.setCustomValue(path, forKey: "Path")
        }

        if let baseUrl = baseUrl {
            firebaseLogs.setCustomValue(baseUrl, forKey: "BaseUrl")
        }
    }
    
    private func debug(request: URLRequest, response: (Data, URLResponse)) {
        #if DEBUG
        print("###########################################################################")
        if let httpResponse = response.1 as? HTTPURLResponse {
            print("\nSTATUS CODE:\n\(httpResponse.statusCode)\n")
        }
        if let headers = request.allHTTPHeaderFields {
            print("HEADERS:\n\(headers)\n")
        }
        if let method = request.httpMethod {
            print("METHOD:\n\(method)\n")
        }
        
        if let url = response.1.url {
            print("URL:\n\(url.absoluteString.replacingOccurrences(of: "?", with: ""))\n")
        }
        
        if let bodyData = request.httpBody, let body = String(data: bodyData, encoding: .utf8) {
            print("BODY DATA:\n\(body)\n")
        }
        if let value = String(data: response.0, encoding: .utf8) {
            print("RESPONSE DATA:\n\(value)\n")
        }
        print("###########################################################################")
        #endif
    }
}
