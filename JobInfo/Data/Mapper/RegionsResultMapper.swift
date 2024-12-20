//
//  RegionsResultMapper.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

final class RegionsResultMapper {
    func map(items: [JobRegionDTO]) -> [JobRegion] {
        return items.map { JobRegion(id: $0.id, name: $0.name) }
    }
}
