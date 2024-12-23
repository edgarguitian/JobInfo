//
//  GetCompanyTypesStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation
@testable import JobInfo

final class GetCompanyTypesStub: GetCompanyTypesType {
    var isSuccess = true
    var companyTypes: [CompanyType] = []
    
    func execute() async throws(JobInfoDomainError) -> [CompanyType] {
        if isSuccess {
            return companyTypes
        }
        throw JobInfoDomainError.generic
    }
}

