//
//  GetJobsByRegionRepositoryStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation
@testable import JobInfo

final class GetJobsByRegionRepositoryStub: GetJobsByRegionRepositoryType {
    var isSuccess = true
    var jobs: JobResult?

    func getJobsByRegion(regionId: Int, currentPage: Int) async throws(JobInfoDomainError) -> JobResult {
        if isSuccess {
            return jobs!
        }
        throw JobInfoDomainError.generic
    }
}
