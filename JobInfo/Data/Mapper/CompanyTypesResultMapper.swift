//
//  CompanyTypesResultMapper.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class CompanyTypesResultMapper {
    func map(items: [CompanyTypeDTO]) -> [CompanyType] {
        return items.map { CompanyType(id: $0.id, name: $0.name) }
    }
}
