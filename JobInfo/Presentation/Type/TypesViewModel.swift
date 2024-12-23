//
//  TypesViewModel.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class TypesViewModel: ObservableObject, @unchecked Sendable {
    private let getTypes: GetTypesType
    private let errorMapper: JobInfoPresentableErrorMapper
    
    @Published var types: [JobType] = []
    @Published var showLoadingSpinner: Bool = true
    @Published var errorMessage: String?
    @Published var showError: Bool = false
    
    init(getTypes: GetTypesType,
         errorMapper: JobInfoPresentableErrorMapper) {
        self.getTypes = getTypes
        self.errorMapper = errorMapper
    }
    
    @MainActor
    func getInfoTypes() async throws {
        let uiTestErrorHandling = ProcessInfo.processInfo.arguments.contains("UITestErrorHandlingJobsTypes")
        if uiTestErrorHandling {
            Task { @MainActor in
                errorMessage = "Error al cargar la vista en UITest"
                showError = true
            }
        } else {
            do throws(JobInfoDomainError) {
                let result = try await self.getTypes.execute()
                self.handleResult(result)
            } catch {
                self.handleError(error: error)
                throw error
            }
        }
    }
    
    @MainActor
    private func handleResult(_ infoTypes: [JobType]) {
        showLoadingSpinner = false
        showError = false
        types = infoTypes
    }
    
    private func handleError(error: JobInfoDomainError) {
        showLoadingSpinner = false
        errorMessage = errorMapper.mapError(error: error)
        showError = true
    }
}
