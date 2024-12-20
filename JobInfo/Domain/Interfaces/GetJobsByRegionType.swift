//
//  GetJobsByRegionType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

protocol GetJobsByRegionType {
    func execute(regionId: Int, currentPage: Int) async throws(JobInfoDomainError) -> JobResult
}
