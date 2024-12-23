//
//  CompanyTypesFactory.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class CompanyTypesFactory: @preconcurrency CreateCompanyTypesView  {
    // MARK: UI
    @MainActor func create() -> CompanyTypesView {
        return CompanyTypesView(viewModel: createCompanyTypesViewModel(),
                                createJobsView: JobsFactory())
    }
    
    // MARK: View Model
    private func createCompanyTypesViewModel() -> CompanyTypesViewModel {
        return CompanyTypesViewModel(getCompanyTypes: createGetCompanyTypesUseCase(),
                                     errorMapper: JobInfoPresentableErrorMapper())
    }
    
    // MARK: Use Case
    private func createGetCompanyTypesUseCase() -> GetCompanyTypesType {
        return GetCompanyTypes(repository: createGetCompanyTypesRepository())
    }
    
    // MARK: Repository
    private func createGetCompanyTypesRepository() -> GetCompanyTypesRepositoryType {
        return GetCompanyTypesRepository(apiDataSource: createApiGetCompanyTypesDataSource(),
                                         errorMapper: JobInfoDomainErrorMapper(),
                                         companyTypesResultMapper: CompanyTypesResultMapper())
    }
    
    // MARK: Data Source
    private func createApiGetCompanyTypesDataSource() -> APIGetCompanyTypesDataSourceType {
        return APIGetCompanyTypesDataSource(httpClient: createHTTPClient())
    }
    
    // MARK: HTTP Client
    private func createHTTPClient() -> HTTPClient {
        return URLSessionHTTPCLient(requestMaker: URLSessionRequestMaker(),
                                    errorResolver: URLSessionErrorResolver())
    }
    
}
