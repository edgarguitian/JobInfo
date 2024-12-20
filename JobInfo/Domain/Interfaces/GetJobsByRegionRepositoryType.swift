//
//  GetJobsByRegionRepositoryType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

protocol GetJobsByRegionRepositoryType {
    func getJobsByRegion(regionId: Int, currentPage: Int) async throws(JobInfoDomainError) -> JobResult

}
