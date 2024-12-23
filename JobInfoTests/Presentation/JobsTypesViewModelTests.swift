//
//  JobsTypesViewModelTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Testing
@testable import JobInfo
import Combine
import Foundation

final class JobsTypesViewModelTests {
    var cancellables = Set<AnyCancellable>()
    
    deinit {
        cancellables.removeAll()
    }
    
    @Test func test_init() async throws {
        // GIVEN
        let getTypesStub =  GetTypesStub()
        let errorMapper = JobInfoPresentableErrorMapper()
        
        // WHEN
        let viewModel = TypesViewModel(getTypes: getTypesStub,
                                       errorMapper: errorMapper)
        
        // THEN
        #expect(viewModel.showLoadingSpinner == true)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.showError == false)
        #expect(viewModel.types.count ==  0)
    }
    
    @Test func test_getInfoTypes_success() async throws {
        // GIVEN
        let getTypesStub =  GetTypesStub()
        let expectedTypes = [JobType(id: 1, name: "Type1"), JobType(id: 2, name: "Type2")]
        getTypesStub.types = expectedTypes
        let errorMapper = JobInfoPresentableErrorMapper()
        let viewModel = TypesViewModel(getTypes: getTypesStub,
                                       errorMapper: errorMapper)
        
        // WHEN
        try await viewModel.getInfoTypes()
        
        // THEN
        #expect(viewModel.showLoadingSpinner == false)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.showError == false)
        #expect(viewModel.types.count == 2)
        
    }
    
    @Test func test_getInfoTypes_fail() async {
        // GIVEN
        let getTypesStub =  GetTypesStub()
        getTypesStub.isSuccess = false
        let errorMapper = JobInfoPresentableErrorMapper()
        let viewModel = TypesViewModel(getTypes: getTypesStub,
                                       errorMapper: errorMapper)
        
        // WHEN
        await #expect(
            throws: JobInfoDomainError.generic,
            "An error should be thrown when isSuccess is false",
            performing: { try await viewModel.getInfoTypes() })
        
        // THEN
        #expect(viewModel.showLoadingSpinner == false)
        #expect(viewModel.errorMessage != nil)
        #expect(viewModel.showError == true)
        #expect(viewModel.types.count == 0)
    }
    
}

