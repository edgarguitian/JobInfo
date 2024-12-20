//
//  APIGetJobsByRegionDataSource.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class APIGetJobsByRegionDataSource: APIGetJobsByRegionDataSourceType {
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func getJobsByRegion(regionId: Int, currentPage: Int) async throws(HTTPClientError) -> JobResultDTO {
        let body: [String: Any] = [:]

        let queryParameters: [String: Any] = [
            "region_id": regionId,
            "page": currentPage
        ]

        let endpoint = Endpoint(path: getJobsByRegionsPath,
                                queryParameters: queryParameters,
                                body: body,
                                method: .get)

        do {
            let result = try await httpClient.makeRequest(endpoint: endpoint, baseUrl: urlBase)

            var contextJoke = ""
            do {
                let jobsByRegionResponse = try JSONDecoder().decode(JobResultDTO.self, from: result)
                return jobsByRegionResponse
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
            firebaseLogs.sendRecord(message: "Error_Decoding_JobsByRegion",
                                    description: contextJoke)
            throw HTTPClientError.parsingError
        } catch let error as HTTPClientError {
            throw error
        } catch {
            throw HTTPClientError.generic
        }
    }
    

}
