//
//  JobsTypesFactory.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class JobsTypesFactory: @preconcurrency CreateJobsByTypeView  {
    // MARK: UI
    @MainActor func create() -> JobsTypesView {
        return JobsTypesView(viewModel: createJobsTypesViewModel())
    }
    
    // MARK: View Model
    private func createJobsTypesViewModel() -> JobsTypesViewModel {
        return JobsTypesViewModel(getTypes: createGetTypesUseCase(),
                                  errorMapper: JobInfoPresentableErrorMapper())
    }
    
    // MARK: Use Case
    private func createGetTypesUseCase() -> GetTypesType {
        return GetTypes(repository: createGetTypesRepository())
    }
    
    // MARK: Repository
    private func createGetTypesRepository() -> GetTypesRepositoryType {
        return GetTypesRepository(apiDataSource: createApiGetTypesDataSource(),
                                  errorMapper: JobInfoDomainErrorMapper(),
                                  typesResultMapper: TypesResultMapper())
    }
    
    // MARK: Data Source
    private func createApiGetTypesDataSource() -> APIGetTypesDataSourceType {
        return APIGetTypesDataSource(httpClient: createHTTPClient())
    }
    
    // MARK: HTTP Client
    private func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }
    
}
