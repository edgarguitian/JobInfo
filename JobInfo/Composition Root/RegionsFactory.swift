//
//  RegionsFactory.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

final class RegionsFactory: @preconcurrency CreateRegionsView {
    // MARK: UI
    @MainActor func create() -> RegionsView {
        return RegionsView(viewModel: createRegionsViewModel(),
                           createJobsView: JobsFactory())
    }
    
    // MARK: View Model
    private func createRegionsViewModel() -> RegionsViewModel {
        return RegionsViewModel(getRegions: createGetRegionsUseCase(),
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
