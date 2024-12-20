//
//  GetRegionsRepositoryStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation
@testable import JobInfo

final class GetRegionsRepositoryStub: GetRegionsRepositoryType {
    var isSuccess = true
    var regions: [JobRegion] = []
    
    func getRegions() async throws(JobInfoDomainError) -> [JobRegion] {
        if isSuccess {
            return regions
        }
        throw JobInfoDomainError.generic
    }
}
