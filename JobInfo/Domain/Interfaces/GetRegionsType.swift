//
//  GetRegionsType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

protocol GetRegionsType {
    func execute() async throws(JobInfoDomainError) -> [JobRegion]
}
