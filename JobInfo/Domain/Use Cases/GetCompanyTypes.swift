//
//  GetCompanyTypes.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class GetCompanyTypes: GetCompanyTypesType {
    private let repository: GetCompanyTypesRepositoryType
    
    init(repository: GetCompanyTypesRepositoryType) {
        self.repository = repository
    }
    
    func execute() async throws(JobInfoDomainError) -> [CompanyType] {
        do {
            return try await repository.getCompanyTypes()
        } catch {
            throw error
        }
    }
}
