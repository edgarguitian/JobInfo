//
//  JobsRegionsViewModel.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

final class JobsRegionsViewModel: ObservableObject, @unchecked Sendable {
    private let getRegions: GetRegionsType
    private let errorMapper: JobInfoPresentableErrorMapper

    @Published var regions: [JobRegion] = []
    @Published var showLoadingSpinner: Bool = true
    @Published var errorMessage: String?
    @Published var showError: Bool = false
    
    init(getRegions: GetRegionsType,
         errorMapper: JobInfoPresentableErrorMapper) {
        self.getRegions = getRegions
        self.errorMapper = errorMapper
    }

    @MainActor
    func getInfoRegions() async throws {
        let uiTestErrorHandling = ProcessInfo.processInfo.arguments.contains("UITestErrorHandlingJobsRegions")
        if uiTestErrorHandling {
            Task { @MainActor in
                errorMessage = "Error al cargar la vista en UITest"
                showError = true
            }
        } else {
            do throws(JobInfoDomainError) {
                let result = try await self.getRegions.execute()
                self.handleResult(result)
            } catch {
                self.handleError(error: error)
                throw error
            }
        }
    }

    @MainActor
    private func handleResult(_ infoRegions: [JobRegion]) {
        showLoadingSpinner = false
        showError = false
        regions = infoRegions
    }
    
    private func handleError(error: JobInfoDomainError) {
        showLoadingSpinner = false
        errorMessage = errorMapper.mapError(error: error)
        showError = true
    }

}
