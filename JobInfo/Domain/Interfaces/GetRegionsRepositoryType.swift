//
//  GetRegionsRepositoryType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

protocol GetRegionsRepositoryType {
    func getRegions() async throws(JobInfoDomainError) -> [JobRegion]
}
