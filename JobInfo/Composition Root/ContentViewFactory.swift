//
//  ContentViewFactory.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import Foundation

final class ContentViewFactory {
    // MARK: UI
    @MainActor static func create() -> ContentView {
        return ContentView(createJobsByRegionView: JobsRegionsFactory())
    }
}
