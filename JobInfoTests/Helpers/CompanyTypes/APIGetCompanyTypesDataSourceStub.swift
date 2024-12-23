//
//  APIGetCompanyTypesDataSourceStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation
@testable import JobInfo

final class APIGetCompanyTypesDataSourceStub: APIGetCompanyTypesDataSourceType {
    var isSuccess = true
    var companyTypes: [CompanyTypeDTO] = []
    
    func getCompanyTypes() async throws(HTTPClientError) -> [CompanyTypeDTO] {
        if isSuccess {
            return companyTypes
        }
        throw HTTPClientError.generic
    }
}
