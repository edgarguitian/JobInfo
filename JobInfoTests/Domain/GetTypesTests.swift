//
//  GetTypesTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Testing
@testable import JobInfo

struct GetTypesTests {
    
    @Test func test_execute_sucesfully_returns_types() async throws {
        // GIVEN
        let stub = GetTypesRepositoryStub()
        let expectedTypes = [JobType(id: 1, name: "Type1"), JobType(id: 2, name: "Type2")]
        stub.types = expectedTypes
        let sut = GetTypes(repository: stub)
        
        // WHEN
        let capturedTypesResult = try await sut.execute()
        
        // THEN
        #expect(capturedTypesResult == expectedTypes)
    }
    
    @Test func test_execute_returns_error_when_repository_returns_error() async throws {
        // GIVEN
        let stub = GetTypesRepositoryStub()
        stub.isSuccess = false
        let sut = GetTypes(repository: stub)
        
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
