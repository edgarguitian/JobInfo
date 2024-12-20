//
//  JobResultDTO.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

struct JobResultDTO: Codable {
    let count: Int
    let next: String?
    let previous: String?
    let results: [JobDTO]

    enum CodingKeys: String, CodingKey {
        case count
        case next
        case previous
        case results
    }
}
