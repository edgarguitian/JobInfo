//
//  GetCompanyTypesRepositoryTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Testing
@testable import JobInfo

struct GetCompanyTypesRepositoryTests {
    
    @Test func test_getCompanyTypes_returns_success_companyTypes() async throws {
        // GIVEN
        let apiGetCompanyTypesStub = APIGetCompanyTypesDataSourceStub()
        let expectedCompanyTypes = [CompanyTypeDTO(id: 1, name: "CompanyType1"), CompanyTypeDTO(id: 2, name: "CompanyType2")]
        apiGetCompanyTypesStub.companyTypes = expectedCompanyTypes
        let sut = GetCompanyTypesRepository(apiDataSource: apiGetCompanyTypesStub,
                                            errorMapper: JobInfoDomainErrorMapper(),
                                            companyTypesResultMapper: CompanyTypesResultMapper())
        
        // WHEN
        let capturedCompanyTypesResult = try await sut.getCompanyTypes()
        
        // THEN
        #expect(capturedCompanyTypesResult.count == expectedCompanyTypes.count)
        #expect(capturedCompanyTypesResult.first!.name == expectedCompanyTypes.first!.name)
        #expect(capturedCompanyTypesResult.first!.id == expectedCompanyTypes.first!.id)
        #expect(capturedCompanyTypesResult.last!.id == expectedCompanyTypes.last!.id)
        #expect(capturedCompanyTypesResult.last!.name == expectedCompanyTypes.last!.name)
        
    }
    
    @Test func test_getCompanyTypes_returns_failure_when_getCompanyTypesDataSource_fails() async throws {
        // GIVEN
        let apiGetCompanyTypesStub = APIGetCompanyTypesDataSourceStub()
        apiGetCompanyTypesStub.isSuccess = false
        let sut = GetCompanyTypesRepository(apiDataSource: apiGetCompanyTypesStub,
                                            errorMapper: JobInfoDomainErrorMapper(),
                                            companyTypesResultMapper: CompanyTypesResultMapper())
        
        // WHEN
        do {
            _ = try await sut.getCompanyTypes()
            
            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == JobInfoDomainError.generic)
        }
    }
    
}
