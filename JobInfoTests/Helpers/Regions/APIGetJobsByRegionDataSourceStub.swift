//
//  APIGetJobsByRegionDataSourceStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation
@testable import JobInfo

final class APIGetJobsByRegionDataSourceStub: APIGetJobsByRegionDataSourceType {
    var isSuccess = false
    var jobs: JobResultDTO?

    func getJobsByRegion(regionId: Int, currentPage: Int) async throws(HTTPClientError) -> JobResultDTO {
        if isSuccess {
            return jobs!
        }
        throw HTTPClientError.generic
    }
}
