//
//  JobsByRegionResultMapperTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Testing
@testable import JobInfo

struct JobsResultMapperTests {

    @Test func test_map() async throws {
        // GIVEN
        let jobsResultMapper = JobsResultMapper()
        let jobResultDTO = JobResultDTO(count: 10, next: "nextResult", previous: "previousResult", results: [])

        // WHEN
        let result = jobsResultMapper.map(jobsResult: jobResultDTO)

        // THEN
        #expect(result.count == jobResultDTO.count)
        #expect(result.next == jobResultDTO.next)
        #expect(result.previous == jobResultDTO.previous)
        #expect(result.results.count == jobResultDTO.results.count)
    }

}
