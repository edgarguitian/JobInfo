//
//  APIGetRegionsDataSourceStub.swift
//  JobInfoTests
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation
@testable import JobInfo

final class APIGetRegionsDataSourceStub: APIGetRegionsDataSourceType {
    var isSuccess = false
    var regions: [JobRegionDTO] = []
    
    func getRegions() async throws(HTTPClientError) -> [JobRegionDTO] {
        if isSuccess {
            return regions
        }
        throw HTTPClientError.generic
    }
}
