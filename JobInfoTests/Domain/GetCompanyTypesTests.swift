//
//  GetCompanyTypesTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Testing
@testable import JobInfo

struct GetCompanyTypesTests {
    
    @Test func test_execute_sucesfully_returns_companyTypes() async throws {
        // GIVEN
        let stub = GetCompanyTypesRepositoryStub()
        let expectedCompanyTypes = [CompanyType(id: 1, name: "CompanyType1"), CompanyType(id: 2, name: "CompanyType2")]
        stub.companyTypes = expectedCompanyTypes
        let sut = GetCompanyTypes(repository: stub)
        
        // WHEN
        let capturedCompanyTypesResult = try await sut.execute()
        
        // THEN
        #expect(capturedCompanyTypesResult == expectedCompanyTypes)
    }
    
    @Test func test_execute_returns_error_when_repository_returns_error() async throws {
        // GIVEN
        let stub = GetCompanyTypesRepositoryStub()
        stub.isSuccess = false
        let sut = GetCompanyTypes(repository: stub)
        
        // WHEN
        do {
            _ = try await sut.execute()
            
            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == JobInfoDomainError.generic)
        }
    }
}

