//
//  JobsViewModel.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class JobsViewModel: ObservableObject, @unchecked Sendable {
    private let getJobs: GetJobsType
    private let errorMapper: JobInfoPresentableErrorMapper
    private let filterID: Int
    private let filterType: JobFilter

    @Published var jobs: [Job] = []
    @Published var showLoadingSpinner: Bool = true
    @Published var errorMessage: String?
    @Published var showError: Bool = false
    
    init(getJobs: GetJobsType,
         errorMapper: JobInfoPresentableErrorMapper,
         filterID: Int,
         filterType: JobFilter) {
        self.getJobs = getJobs
        self.errorMapper = errorMapper
        self.filterID = filterID
        self.filterType = filterType
    }

    @MainActor
    func getJobs() async throws {
        let uiTestErrorHandling = ProcessInfo.processInfo.arguments.contains("UITestErrorHandlingJobsRegions")
        if uiTestErrorHandling {
            Task { @MainActor in
                errorMessage = "Error al cargar la vista en UITest"
                showError = true
            }
        } else {
            do throws(JobInfoDomainError) {
                let result = try await self.getJobs.execute(filterID: filterID, filterType: filterType)
                self.handleResult(result)
            } catch {
                self.handleError(error: error)
                throw error
            }
        }
    }

    @MainActor
    private func handleResult(_ infoJobs: JobResult) {
        showLoadingSpinner = false
        showError = false
        jobs = infoJobs.results
    }
    
    private func handleError(error: JobInfoDomainError) {
        showLoadingSpinner = false
        errorMessage = errorMapper.mapError(error: error)
        showError = true
    }

}
