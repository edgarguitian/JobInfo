//
//  GetCompanyTypesRepository.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class GetCompanyTypesRepository: GetCompanyTypesRepositoryType {
    private let apiDataSource: APIGetCompanyTypesDataSourceType
    private let errorMapper: JobInfoDomainErrorMapper
    private let companyTypesResultMapper: CompanyTypesResultMapper
    
    init(apiDataSource: APIGetCompanyTypesDataSourceType,
         errorMapper: JobInfoDomainErrorMapper,
         companyTypesResultMapper: CompanyTypesResultMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.companyTypesResultMapper = companyTypesResultMapper
    }
    
    func getCompanyTypes() async throws(JobInfoDomainError) -> [CompanyType] {
        do {
            let companyTypesResult = try await apiDataSource.getCompanyTypes()
            let companyTypesDomain = companyTypesResultMapper.map(items: companyTypesResult)
            return companyTypesDomain
        } catch {
            throw errorMapper.map(error: error)
        }
    }
}
