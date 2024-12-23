//
//  APIGetTypesDataSourceType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

protocol APIGetTypesDataSourceType {
    func getTypes() async throws(HTTPClientError) -> [JobTypeDTO]
}
