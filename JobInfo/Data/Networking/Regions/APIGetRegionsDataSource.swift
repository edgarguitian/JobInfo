//
//  APIGetRegionsDataSource.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

final class APIGetRegionsDataSource: APIGetRegionsDataSourceType {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getRegions() async throws(HTTPClientError) -> [JobRegionDTO] {
        let body: [String: Any] = [:]

        let queryParameters: [String: Any] = [:]

        let endpoint = Endpoint(path: getRegionsPath,
                                queryParameters: queryParameters,
                                body: body,
                                method: .get)

        do {
            let result = try await httpClient.makeRequest(endpoint: endpoint, baseUrl: urlBase)

            var contextJoke = ""
            do {
                let jobRegionsResponse = try JSONDecoder().decode([JobRegionDTO].self, from: result)
                return jobRegionsResponse
            } catch let DecodingError.dataCorrupted(context) {
                print("Data corrupted: \(context.debugDescription)")
                print("Coding Path: \(context.codingPath)")
                contextJoke = context.codingPath.description
            } catch let DecodingError.keyNotFound(key, context) {
                print("Key '\(key)' not found: \(context.debugDescription)")
                print("Coding Path: \(context.codingPath)")
                contextJoke = context.codingPath.description
            } catch let DecodingError.typeMismatch(type, context) {
                print("Type '\(type)' mismatch: \(context.debugDescription)")
                print("Coding Path: \(context.codingPath)")
                contextJoke = context.codingPath.description
            } catch let DecodingError.valueNotFound(value, context) {
                print("Value '\(value)' not found: \(context.debugDescription)")
                print("Coding Path: \(context.codingPath)")
                contextJoke = context.codingPath.description
            } catch {
                print("Unexpected error: \(error.localizedDescription)")
                contextJoke = error.localizedDescription
            }
            firebaseLogs.sendRecord(message: "Error_Decoding_JobRegions",
                                    description: contextJoke)
            throw HTTPClientError.parsingError
        } catch let error as HTTPClientError {
            throw error
        } catch {
            throw HTTPClientError.generic
        }
    }
}
