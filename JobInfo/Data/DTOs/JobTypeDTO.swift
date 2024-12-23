//
//  JobTypeDTO.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import Foundation

struct JobTypeDTO: Codable {
    let id: Int
    let name: String

    enum CodingKeys: String, CodingKey {
        case id
        case name
    }
}