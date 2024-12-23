//
//  GetJobsByRegion.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class GetJobs: GetJobsType {
    private let repository: GetJobsRepositoryType

    init(repository: GetJobsRepositoryType) {
        self.repository = repository
    }

    func execute(filterID: Int, filterType: JobFilter) async throws(JobInfoDomainError) -> JobResult {
        do {
            return try await repository.getJobs(filterID: filterID, filterType: filterType)
        } catch {
            throw error
        }
    }
}
