//
//  APIGetTypesDataSource.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class APIGetTypesDataSource: APIGetTypesDataSourceType {
    private let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func getTypes() async throws(HTTPClientError) -> [JobTypeDTO] {
        let body: [String: Any] = [:]

        let queryParameters: [String: Any] = [:]

        let endpoint = Endpoint(path: getTypesPath,
                                queryParameters: queryParameters,
                                body: body,
                                method: .get)

        do {
            let result = try await httpClient.makeRequest(endpoint: endpoint, baseUrl: urlBase)

            var contextJoke = ""
            do {
                let jobTypesResponse = try JSONDecoder().decode([JobTypeDTO].self, from: result)
                return jobTypesResponse
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
            firebaseLogs.sendRecord(message: "Error_Decoding_JobTypes",
                                    description: contextJoke)
            throw HTTPClientError.parsingError
        } catch let error as HTTPClientError {
            throw error
        } catch {
            throw HTTPClientError.generic
        }
    }
}
