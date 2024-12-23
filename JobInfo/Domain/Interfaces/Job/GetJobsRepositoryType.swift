//
//  GetJobsByRegionRepositoryType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

protocol GetJobsRepositoryType {
    func getJobs(filterID: Int, filterType: JobFilter) async throws(JobInfoDomainError) -> JobResult

}
