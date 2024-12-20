//
//  JobInfoPresentableErrorMapperTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Testing
@testable import JobInfo
struct JobInfoPresentableErrorMapperTests {

    @Test func test_map_error_nil() async throws {
        // GIVEN
        let errorMapper = JobInfoPresentableErrorMapper()

        // WHEN
        let result = errorMapper.mapError(error: nil)

        // THEN
        #expect(result == "Communication Error")
    }
    
    @Test func test_map_error_notnil() async throws {
        // GIVEN
        let errorMapper = JobInfoPresentableErrorMapper()

        // WHEN
        let result = errorMapper.mapError(error: nil)

        // THEN
        #expect(result == "Communication Error")
    }

}
