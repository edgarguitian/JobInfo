//
//  CompanyTypesResultMapperTests.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Testing
@testable import JobInfo

struct CompanyTypesResultMapperTests {

    @Test func test_map() async throws {
        // GIVEN
        let companyTypesResultMapper = CompanyTypesResultMapper()
        let companyTypesDTO = [CompanyTypeDTO(id: 1, name: "CompanyType1"), CompanyTypeDTO(id: 2, name: "CompanyType2")]

        // WHEN
        let result = companyTypesResultMapper.map(items: companyTypesDTO)

        // THEN
        #expect(result.count == companyTypesDTO.count)
        #expect(result.first!.name == companyTypesDTO.first!.name)
        #expect(result.first!.id == companyTypesDTO.first!.id)
        #expect(result.last!.id == companyTypesDTO.last!.id)
        #expect(result.last!.name == companyTypesDTO.last!.name)
    }

}
