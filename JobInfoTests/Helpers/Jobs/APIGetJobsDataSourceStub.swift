//
//  APIGetJobsDataSourceStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation
@testable import JobInfo

final class APIGetJobsDataSourceStub: APIGetJobsDataSourceType {
    var isSuccess = true
    var jobs: JobResultDTO?

    func getJobs(filterID: Int, filterType: JobFilter) async throws(HTTPClientError) -> JobResultDTO {
        if isSuccess {
            return jobs!
        }
        throw HTTPClientError.generic
    }
}
