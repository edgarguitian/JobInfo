//
//  CreateJobsView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import Foundation

protocol CreateJobsView {
    func create(filterID: Int, filterType: JobFilter) -> JobsView
}
