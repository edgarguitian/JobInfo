//
//  GetTypesStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation
@testable import JobInfo

final class GetTypesStub: GetTypesType {
    var isSuccess = true
    var types: [JobType] = []
    
    func execute() async throws(JobInfoDomainError) -> [JobType] {
        if isSuccess {
            return types
        }
        throw JobInfoDomainError.generic
    }
}
