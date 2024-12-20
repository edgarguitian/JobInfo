//
//  JobsFactory.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class JobsFactory: @preconcurrency CreateJobsView {
    // MARK: UI
    @MainActor func create(regionID: Int) -> JobsView {
        return JobsView(viewModel: createJobsViewModel(regionId: regionID))
    }
    
    // MARK: View Model
    private func createJobsViewModel(regionId: Int) -> JobsViewModel {
        return JobsViewModel(getJobsByRegion: createGetJobsByRegionUseCase(),
                             errorMapper: JobInfoPresentableErrorMapper(),
                             regionId: regionId)
    }
    
    // MARK: Use Case
    private func createGetJobsByRegionUseCase() -> GetJobsByRegionType {
        return GetJobsByRegion(repository: createGetJobsByRegionRepository())
    }
    
    // MARK: Repository
    private func createGetJobsByRegionRepository() -> GetJobsByRegionRepositoryType {
        return GetJobsByRegionRepository(apiDataSource: createApiGetJobsByRegionDataSource(),
                                         errorMapper: JobInfoDomainErrorMapper(),
                                         jobsByRegionResultMapper: JobsByRegionResultMapper())
    }
    
    // MARK: Data Source
    private func createApiGetJobsByRegionDataSource() -> APIGetJobsByRegionDataSourceType {
        return APIGetJobsByRegionDataSource(httpClient: createHTTPClient())
    }
    
    // MARK: HTTP Client
    private func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }
}
