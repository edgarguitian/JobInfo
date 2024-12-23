//
//  GetCompanyTypesRepositoryStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation
@testable import JobInfo

final class GetCompanyTypesRepositoryStub: GetCompanyTypesRepositoryType {
    var isSuccess = true
    var companyTypes: [CompanyType] = []
    
    func getCompanyTypes() async throws(JobInfoDomainError) -> [CompanyType] {
        if isSuccess {
            return companyTypes
        }
        throw JobInfoDomainError.generic
    }
}
