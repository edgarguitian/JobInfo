//
//  GetCompanyTypesRepositoryType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

protocol GetCompanyTypesRepositoryType {
    func getCompanyTypes() async throws(JobInfoDomainError) -> [CompanyType]
}
