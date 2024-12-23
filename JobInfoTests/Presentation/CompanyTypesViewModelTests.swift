//
//  CompanyTypesViewModelTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Testing
@testable import JobInfo
import Combine
import Foundation

final class CompanyTypesViewModelTests {
    var cancellables = Set<AnyCancellable>()
    
    deinit {
        cancellables.removeAll()
    }
    
    @Test func test_init() async throws {
        // GIVEN
        let getCompanyTypesStub =  GetCompanyTypesStub()
        let errorMapper = JobInfoPresentableErrorMapper()
        
        // WHEN
        let viewModel = JobsByCompanyTypesViewModel(getCompanyTypes: getCompanyTypesStub,
                                                    errorMapper: errorMapper)
        
        // THEN
        #expect(viewModel.showLoadingSpinner == true)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.showError == false)
        #expect(viewModel.companyTypes.count ==  0)
    }
    
    @Test func test_getInfoTypes_success() async throws {
        // GIVEN
        let getCompanyTypesStub =  GetCompanyTypesStub()
        let expectedCompanyTypes = [CompanyType(id: 1, name: "CompanyType1"), CompanyType(id: 2, name: "CompanyType2")]
        getCompanyTypesStub.companyTypes = expectedCompanyTypes
        let errorMapper = JobInfoPresentableErrorMapper()
        let viewModel = JobsByCompanyTypesViewModel(getCompanyTypes: getCompanyTypesStub,
                                                    errorMapper: errorMapper)
        
        // WHEN
        try await viewModel.getInfoCompanyTypes()
        
        // THEN
        #expect(viewModel.showLoadingSpinner == false)
        #expect(viewModel.errorMessage == nil)
        #expect(viewModel.showError == false)
        #expect(viewModel.companyTypes.count == 2)
        
    }
    
    @Test func test_getInfoTypes_fail() async {
        // GIVEN
        let getCompanyTypesStub =  GetCompanyTypesStub()
        getCompanyTypesStub.isSuccess = false
        let errorMapper = JobInfoPresentableErrorMapper()
        let viewModel = JobsByCompanyTypesViewModel(getCompanyTypes: getCompanyTypesStub,
                                                    errorMapper: errorMapper)
        
        // WHEN
        await #expect(
            throws: JobInfoDomainError.generic,
            "An error should be thrown when isSuccess is false",
            performing: { try await viewModel.getInfoCompanyTypes() })
        
        // THEN
        #expect(viewModel.showLoadingSpinner == false)
        #expect(viewModel.errorMessage != nil)
        #expect(viewModel.showError == true)
        #expect(viewModel.companyTypes.count == 0)
    }
    
}


