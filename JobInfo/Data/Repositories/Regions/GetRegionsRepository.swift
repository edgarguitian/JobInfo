//
//  GetRegionsRepository.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

final class GetRegionsRepository: GetRegionsRepositoryType {
    private let apiDataSource: APIGetRegionsDataSourceType
    private let errorMapper: JobInfoDomainErrorMapper
    private let regionsResultMapper: RegionsResultMapper
    
    init(apiDataSource: APIGetRegionsDataSourceType, errorMapper: JobInfoDomainErrorMapper, regionsResultMapper: RegionsResultMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.regionsResultMapper = regionsResultMapper
    }
    
    func getRegions() async throws(JobInfoDomainError) -> [JobRegion] {
        do {
            let regionsResult = try await apiDataSource.getRegions()
            let regionsDomain = regionsResultMapper.map(items: regionsResult)
            return regionsDomain
        } catch {
            throw errorMapper.map(error: error)
        }
    }
}
