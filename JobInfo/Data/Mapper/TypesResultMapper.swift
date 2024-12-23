//
//  TypesResultMapper.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

final class TypesResultMapper {
    func map(items: [JobTypeDTO]) -> [JobType] {
        return items.map { JobType(id: $0.id, name: $0.name) }
    }
}
