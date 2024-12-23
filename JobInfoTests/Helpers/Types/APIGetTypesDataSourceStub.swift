//
//  APIGetTypesDataSourceStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation
@testable import JobInfo

final class APIGetTypesDataSourceStub: APIGetTypesDataSourceType {
    var isSuccess = true
    var types: [JobTypeDTO] = []
    
    func getTypes() async throws(HTTPClientError) -> [JobTypeDTO] {
        if isSuccess {
            return types
        }
        throw HTTPClientError.generic
    }
}
