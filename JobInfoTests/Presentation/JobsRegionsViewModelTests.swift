//
//  JobsRegionsViewModelTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Testing
@testable import JobInfo
import Combine
import Foundation

final class JobsRegionsViewModelTests {
    var cancellables = Set<AnyCancellable>()

    deinit {
        cancellables.removeAll()
    }
    
    @Test func test_init() async throws {
        // GIVEN
        let getRegionsStub =  GetRegionsStub()
        let errorMapper = JobInfoPresentableErrorMapper()

        // WHEN
        let viewModel = JobsRegionsViewModel(getRegions: getRegionsStub,
                                             errorMapper: errorMapper)

        // THEN
        #expect(viewModel.showLoadingSpinner == true)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.showError == false)
        #expect(viewModel.regions.count ==  0)
    }
    
    @Test func test_getInfoRegions_success() async throws {
        // GIVEN
        let getRegionsStub =  GetRegionsStub()
        let expectedRegions = [JobRegion(id: 1, name: "Region1"), JobRegion(id: 2, name: "Region2")]
        getRegionsStub.regions = expectedRegions
        let errorMapper = JobInfoPresentableErrorMapper()
        let viewModel = JobsRegionsViewModel(getRegions: getRegionsStub,
                                             errorMapper: errorMapper)
        
        // WHEN
        try await viewModel.getInfoRegions()

        // THEN
        #expect(viewModel.showLoadingSpinner == false)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.showError == false)
        #expect(viewModel.regions.count == 2)

    }
    
    @Test func test_getInfoRegions_fail() async {
        // GIVEN
        let getRegionsStub =  GetRegionsStub()
        getRegionsStub.isSuccess = false
        let errorMapper = JobInfoPresentableErrorMapper()
        let viewModel = JobsRegionsViewModel(getRegions: getRegionsStub,
                                             errorMapper: errorMapper)

        // WHEN
        await #expect(
            throws: JobInfoDomainError.generic,
            "An error should be thrown when isSuccess is false",
            performing: { try await viewModel.getInfoRegions() })

        // THEN
        #expect(viewModel.showLoadingSpinner == false)
        #expect(viewModel.errorMessage != nil)
        #expect(viewModel.showError == true)
        #expect(viewModel.regions.count == 0)
    }

}
