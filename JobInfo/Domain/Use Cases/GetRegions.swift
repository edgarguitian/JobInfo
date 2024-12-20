//
//  GetRegions.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

final class GetRegions: GetRegionsType {
    private let repository: GetRegionsRepositoryType
    
    init(repository: GetRegionsRepositoryType) {
        self.repository = repository
    }
    
    func execute() async throws(JobInfoDomainError) -> [JobRegion] {
        do {
            return try await repository.getRegions()
        } catch {
            throw error
        }
    }
}
