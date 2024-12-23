//
//  APIGetCompanyTypesDataSourceType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

protocol APIGetCompanyTypesDataSourceType {
    func getCompanyTypes() async throws(HTTPClientError) -> [CompanyTypeDTO]
}
