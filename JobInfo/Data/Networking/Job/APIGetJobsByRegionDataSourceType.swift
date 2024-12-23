//
//  APIGetJobsDataSourceType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

protocol APIGetJobsDataSourceType {
    func getJobs(filterID: Int, filterType: JobFilter) async throws(HTTPClientError) -> JobResultDTO
}
