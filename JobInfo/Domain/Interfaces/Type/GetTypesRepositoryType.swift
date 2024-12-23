//
//  GetTypesRepositoryType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

protocol GetTypesRepositoryType {
    func getTypes() async throws(JobInfoDomainError) -> [JobType]
}
