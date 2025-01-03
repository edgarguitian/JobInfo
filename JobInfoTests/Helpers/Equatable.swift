//
//  Equatable.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation
@testable import JobInfo

extension JobRegion: @retroactive Equatable {
    public static func == (lhs: JobRegion, rhs: JobRegion) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
    }
}

extension JobRegionDTO: @retroactive Equatable {
    public static func == (lhs: JobRegionDTO, rhs: JobRegionDTO) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
    }
}

extension JobTypeDTO: @retroactive Equatable {
    public static func == (lhs: JobTypeDTO, rhs: JobTypeDTO) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
    }
}

extension CompanyTypeDTO: @retroactive Equatable {
    public static func == (lhs: CompanyTypeDTO, rhs: CompanyTypeDTO) -> Bool {
        return lhs.id == rhs.id
        && lhs.name == rhs.name
    }
}
