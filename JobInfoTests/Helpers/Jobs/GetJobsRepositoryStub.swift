//
//  GetJobsRepositoryStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation
@testable import JobInfo

final class GetJobsRepositoryStub: GetJobsRepositoryType {
    var isSuccess = true
    var jobs: JobResult?

    func getJobs(regionId: Int) async throws(JobInfoDomainError) -> JobResult {
        if isSuccess {
            return jobs!
        }
        throw JobInfoDomainError.generic
    }
}
