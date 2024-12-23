//
//  TypesFactory.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class TypesFactory: @preconcurrency CreateTypesView  {
    // MARK: UI
    @MainActor func create() -> TypesView {
        return TypesView(viewModel: createTypesViewModel(),
                         createJobsView: JobsFactory())
    }
    
    // MARK: View Model
    private func createTypesViewModel() -> TypesViewModel {
        return TypesViewModel(getTypes: createGetTypesUseCase(),
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
