//
//  JobsByRegionResultMapper.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

final class JobsByRegionResultMapper {
    func map(jobsByRegionResult: JobResultDTO) -> JobResult{
        return JobResult(count: jobsByRegionResult.count,
                         next: jobsByRegionResult.next,
                         previous: jobsByRegionResult.previous,
                         results: [])
    }
}
