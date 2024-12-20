//
//  JobsRegionsFactory.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

final class JobsRegionsFactory: @preconcurrency CreateJobsByRegionView {
    // MARK: UI
    @MainActor func create() -> JobsRegionsView {
        return JobsRegionsView(viewModel: createJobsRegionsViewModel())
    }
    
    // MARK: View Model
    private func createJobsRegionsViewModel() -> JobsRegionsViewModel {
        return JobsRegionsViewModel(getRegions: createGetRegionsUseCase(),
                                    errorMapper: JobInfoPresentableErrorMapper())
    }
    
    // MARK: Use Case
    private func createGetRegionsUseCase() -> GetRegionsType {
        return GetRegions(repository: createGetRegionsRepository())
    }
    
    // MARK: Repository
    private func createGetRegionsRepository() -> GetRegionsRepositoryType {
        return GetRegionsRepository(apiDataSource: createApiGetRegionsDataSource(),
                                    errorMapper: JobInfoDomainErrorMapper(),
                                    regionsResultMapper: RegionsResultMapper())
    }
    
    // MARK: Data Source
    private func createApiGetRegionsDataSource() -> APIGetRegionsDataSourceType {
        return APIGetRegionsDataSource(httpClient: createHTTPClient())
    }
    
    // MARK: HTTP Client
    private func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }
}
