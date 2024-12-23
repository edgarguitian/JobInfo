//
//  GetJobsByRegionType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

protocol GetJobsType {
    func execute(filterID: Int, filterType: JobFilter) async throws(JobInfoDomainError) -> JobResult
}
