//
//  JobsFactory.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class JobsFactory: @preconcurrency CreateJobsView {
    // MARK: UI
    @MainActor func create(filterID: Int, filterType: JobFilter) -> JobsView {
        return JobsView(viewModel: createJobsViewModel(filterID: filterID,
                                                       filterType: filterType),
                        filterType: filterType)
    }
    
    // MARK: View Model
    private func createJobsViewModel(filterID: Int, filterType: JobFilter) -> JobsViewModel {
        return JobsViewModel(getJobs: createGetJobsUseCase(),
                             errorMapper: JobInfoPresentableErrorMapper(),
                             filterID: filterID,
                             filterType: filterType)
    }
    
    // MARK: Use Case
    private func createGetJobsUseCase() -> GetJobsType {
        return GetJobs(repository: createGetJobsRepository())
    }
    
    // MARK: Repository
    private func createGetJobsRepository() -> GetJobsRepositoryType {
        return GetJobsRepository(apiDataSource: createApiGetJobsDataSource(),
                                         errorMapper: JobInfoDomainErrorMapper(),
                                         jobsResultMapper: JobsResultMapper())
    }
    
    // MARK: Data Source
    private func createApiGetJobsDataSource() -> APIGetJobsDataSourceType {
        return APIGetJobsDataSource(httpClient: createHTTPClient())
    }
    
    // MARK: HTTP Client
    private func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }
}
