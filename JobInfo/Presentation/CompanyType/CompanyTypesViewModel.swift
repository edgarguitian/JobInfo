//
//  CompanyTypesViewModel.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class CompanyTypesViewModel: ObservableObject, @unchecked Sendable {
    private let getCompanyTypes: GetCompanyTypesType
    private let errorMapper: JobInfoPresentableErrorMapper
    
    @Published var companyTypes: [CompanyType] = []
    @Published var showLoadingSpinner: Bool = true
    @Published var errorMessage: String?
    @Published var showError: Bool = false
    
    init(getCompanyTypes: GetCompanyTypesType,
         errorMapper: JobInfoPresentableErrorMapper) {
        self.getCompanyTypes = getCompanyTypes
        self.errorMapper = errorMapper
    }
    
    @MainActor
    func getInfoCompanyTypes() async throws {
        let uiTestErrorHandling = ProcessInfo.processInfo.arguments.contains("UITestErrorHandlingCompanyTypes")
        if uiTestErrorHandling {
            Task { @MainActor in
                errorMessage = "Error al cargar la vista en UITest"
                showError = true
            }
        } else {
            do throws(JobInfoDomainError) {
                let result = try await self.getCompanyTypes.execute()
                self.handleResult(result)
            } catch {
                self.handleError(error: error)
                throw error
            }
        }
    }
    
    @MainActor
    private func handleResult(_ infoCompanyTypes: [CompanyType]) {
        showLoadingSpinner = false
        showError = false
        companyTypes = infoCompanyTypes
    }
    
    private func handleError(error: JobInfoDomainError) {
        showLoadingSpinner = false
        errorMessage = errorMapper.mapError(error: error)
        showError = true
    }
}
