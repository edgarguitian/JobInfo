//
//  APIGetJobsByRegionDataSourceType.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

protocol APIGetJobsByRegionDataSourceType {
    func getJobsByRegion(regionId: Int, currentPage: Int) async throws(HTTPClientError) -> JobResultDTO
}
