//
//  GetJobsByRegionRepository.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class GetJobsByRegionRepository: GetJobsByRegionRepositoryType {
    private let apiDataSource: APIGetJobsByRegionDataSourceType
    private let errorMapper: JobInfoDomainErrorMapper
    private let jobsByRegionResultMapper: JobsByRegionResultMapper

    init(apiDataSource: APIGetJobsByRegionDataSourceType,
         errorMapper: JobInfoDomainErrorMapper,
         jobsByRegionResultMapper: JobsByRegionResultMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.jobsByRegionResultMapper = jobsByRegionResultMapper
    }

    func getJobsByRegion(regionId: Int) async throws(JobInfoDomainError) -> JobResult {
        do {
            let jobsByRegionResult = try await apiDataSource.getJobsByRegion(regionId: regionId)
            let jobsByRegionDomain = jobsByRegionResultMapper.map(jobsByRegionResult: jobsByRegionResult)
            return jobsByRegionDomain
        } catch {
            throw errorMapper.map(error: error)
        }
    }
}
