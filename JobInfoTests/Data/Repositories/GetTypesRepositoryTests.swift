//
//  GetTypesRepositoryTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Testing
@testable import JobInfo

struct GetTypesRepositoryTests {
    
    @Test func test_getTypes_returns_success_types() async throws {
        // GIVEN
        let apiGetTypesStub = APIGetTypesDataSourceStub()
        let expectedTypes = [JobTypeDTO(id: 1, name: "Type1"), JobTypeDTO(id: 2, name: "Type2")]
        apiGetTypesStub.types = expectedTypes
        let sut = GetTypesRepository(apiDataSource: apiGetTypesStub,
                                     errorMapper: JobInfoDomainErrorMapper(),
                                     typesResultMapper: TypesResultMapper())
        
        // WHEN
        let capturedTypesResult = try await sut.getTypes()
        
        // THEN
        #expect(capturedTypesResult.count == expectedTypes.count)
        #expect(capturedTypesResult.first!.name == expectedTypes.first!.name)
        #expect(capturedTypesResult.first!.id == expectedTypes.first!.id)
        #expect(capturedTypesResult.last!.id == expectedTypes.last!.id)
        #expect(capturedTypesResult.last!.name == expectedTypes.last!.name)
        
    }
    
    @Test func test_getTypes_returns_failure_when_getTypesDataSource_fails() async throws {
        // GIVEN
        let apiGetTypesStub = APIGetTypesDataSourceStub()
        apiGetTypesStub.isSuccess = false
        let sut = GetTypesRepository(apiDataSource: apiGetTypesStub,
                                     errorMapper: JobInfoDomainErrorMapper(),
                                     typesResultMapper: TypesResultMapper())
        
        // WHEN
        do {
            _ = try await sut.getTypes()
            
            // THEN
            Issue.record("Expected failure, but the request succeeded")
        } catch {
            #expect(error == JobInfoDomainError.generic)
        }
    }
    
}
