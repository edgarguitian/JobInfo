//
//  RegionsResultMapperTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Testing
@testable import JobInfo

struct RegionsResultMapperTests {

    @Test func test_map() async throws {
        // GIVEN
        let regionsResultMapper = RegionsResultMapper()
        let regionsDTO = [JobRegionDTO(id: 1, name: "Region1"), JobRegionDTO(id: 2, name: "Region2")]

        // WHEN
        let result = regionsResultMapper.map(items: regionsDTO)

        // THEN
        #expect(result.count == regionsDTO.count)
        #expect(result.first!.name == regionsDTO.first!.name)
        #expect(result.first!.id == regionsDTO.first!.id)
        #expect(result.last!.id == regionsDTO.last!.id)
        #expect(result.last!.name == regionsDTO.last!.name)
    }

}
