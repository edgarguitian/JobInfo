//
//  TypesResultMapperTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Testing
@testable import JobInfo

struct TypesResultMapperTests {

    @Test func test_map() async throws {
        // GIVEN
        let typesResultMapper = TypesResultMapper()
        let typesDTO = [JobTypeDTO(id: 1, name: "Type1"), JobTypeDTO(id: 2, name: "Type1")]

        // WHEN
        let result = typesResultMapper.map(items: typesDTO)

        // THEN
        #expect(result.count == typesDTO.count)
        #expect(result.first!.name == typesDTO.first!.name)
        #expect(result.first!.id == typesDTO.first!.id)
        #expect(result.last!.id == typesDTO.last!.id)
        #expect(result.last!.name == typesDTO.last!.name)
    }

}
