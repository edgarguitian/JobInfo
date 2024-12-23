//
//  GetTypesRepository.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class GetTypesRepository: GetTypesRepositoryType {
    private let apiDataSource: APIGetTypesDataSourceType
    private let errorMapper: JobInfoDomainErrorMapper
    private let typesResultMapper: TypesResultMapper
    
    init(apiDataSource: APIGetTypesDataSourceType,
         errorMapper: JobInfoDomainErrorMapper,
         typesResultMapper: TypesResultMapper) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
        self.typesResultMapper = typesResultMapper
    }
    
    func getTypes() async throws(JobInfoDomainError) -> [JobType] {
        do {
            let typesResult = try await apiDataSource.getTypes()
            let typesDomain = typesResultMapper.map(items: typesResult)
            return typesDomain
        } catch {
            throw errorMapper.map(error: error)
        }
    }
}
