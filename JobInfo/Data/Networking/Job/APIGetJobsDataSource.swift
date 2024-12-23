//
//  APIGetJobsDataSource.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class APIGetJobsDataSource: APIGetJobsDataSourceType {
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func getJobs(filterID: Int, filterType: JobFilter) async throws(HTTPClientError) -> JobResultDTO {
        let body: [String: Any] = [:]

        var queryParameters: [String: Any] = [:]
        
        switch filterType {
        case .byRegion:
            queryParameters[regionType] = filterID
        case .byType:
            queryParameters[jobType] = filterID
        case .byCompanyType:
            queryParameters[companyType] = filterID
        }

        let endpoint = Endpoint(path: getJobsPath,
                                queryParameters: queryParameters,
                                body: body,
                                method: .get)

        do {
            let result = try await httpClient.makeRequest(endpoint: endpoint, baseUrl: urlBase)

            var contextJoke = ""
            do {
                let decoder = JSONDecoder()
                decoder.dateDecodingStrategy = .iso8601
                let jobsResponse = try decoder.decode(JobResultDTO.self, from: result)
                return jobsResponse
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
