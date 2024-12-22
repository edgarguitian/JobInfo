//
//  GetJobsByRegion.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class GetJobsByRegion: GetJobsByRegionType {
    private let repository: GetJobsByRegionRepositoryType

    init(repository: GetJobsByRegionRepositoryType) {
        self.repository = repository
    }

    func execute(regionId: Int) async throws(JobInfoDomainError) -> JobResult {
        do {
            return try await repository.getJobsByRegion(regionId: regionId)
        } catch {
            throw error
        }
    }
}
