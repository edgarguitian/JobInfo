//
//  GetCompanyTypesType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

protocol GetCompanyTypesType {
    func execute() async throws(JobInfoDomainError) -> [CompanyType]
}
