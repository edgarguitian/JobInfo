//
//  APIGetRegionsSourceType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

protocol APIGetRegionsDataSourceType {
    func getRegions() async throws(HTTPClientError) -> [JobRegionDTO]
}
