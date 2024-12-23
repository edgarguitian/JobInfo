//
//  GetTypes.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class GetTypes: GetTypesType {
    private let repository: GetTypesRepositoryType
    
    init(repository: GetTypesRepositoryType) {
        self.repository = repository
    }
    
    func execute() async throws(JobInfoDomainError) -> [JobType] {
        do {
            return try await repository.getTypes()
        } catch {
            throw error
        }
    }
}
