//
//  JobInfoDomainErrorMapper.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

final class JobInfoDomainErrorMapper {
    func map(error: HTTPClientError?) -> JobInfoDomainError {
        return .generic
    }
}
