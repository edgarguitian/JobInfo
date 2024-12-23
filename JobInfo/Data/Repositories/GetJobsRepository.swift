//
//  GetJobsByRegionRepository.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class GetJobsRepository: GetJobsRepositoryType {
    private let apiDataSource: APIGetJobsDataSourceType
    private let errorMapper: JobInfoDomainErrorMapper
    private let jobsResultMapper: JobsResultMapper

    init(apiDataSource: APIGetJobsDataSourceType,
         errorMapper: JobInfoDomainErrorMapper,
         jobsResultMapper: JobsResultMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.jobsResultMapper = jobsResultMapper
    }

    func getJobs(filterID: Int, filterType: JobFilter) async throws(JobInfoDomainError) -> JobResult {
        do {
            let jobsResult = try await apiDataSource.getJobs(filterID: filterID, filterType: filterType)
            let jobsDomain = jobsResultMapper.map(jobsResult: jobsResult)
            return jobsDomain
        } catch {
            throw errorMapper.map(error: error)
        }
    }
}
