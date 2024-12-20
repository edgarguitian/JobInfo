//
//  GetRegionsStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation
@testable import JobInfo
final class GetRegionsStub: GetRegionsType {
    var isSuccess = true
    var regions: [JobRegion] = []
    
    func execute() async throws(JobInfoDomainError) -> [JobRegion] {
        if isSuccess {
            return regions
        }
        throw JobInfoDomainError.generic
    }
}
