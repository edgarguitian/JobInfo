//
//  ContentView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import SwiftUI

struct ContentView: View {
    private let createJobsByRegionView: CreateJobsByRegionView

    /// View Properties
    private let lineWidthStroke: CGFloat = 3
    private let cornerRadiusRoundedRectangle: CGFloat = 20
    private let paddingLabelsJobs: CGFloat = 10

    init(createJobsByRegionView: CreateJobsByRegionView) {
        self.createJobsByRegionView = createJobsByRegionView
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {

                NavigationLink(destination:
                                createJobsByRegionView.create()) {
                    HStack {
                        Image(systemName: "network")
                        Text("Jobs by Region")
                    }
                    .padding(paddingLabelsJobs)
                    .overlay {
                        RoundedRectangle(cornerRadius: cornerRadiusRoundedRectangle)
                            .stroke(lineWidth: lineWidthStroke)

                    }
                }
                .accessibilityIdentifier("navItemRegion")

                NavigationLink(destination:
                                createJobsByRegionView.create()) {
                    Text("🀍 Jobs by Language")
                        .padding(paddingLabelsJobs)
                        .overlay {
                            RoundedRectangle(cornerRadius: cornerRadiusRoundedRectangle)
                                .stroke(lineWidth: lineWidthStroke)

                        }
                }
                .accessibilityIdentifier("navItemLanguage")

                NavigationLink(destination:
                                createJobsByRegionView.create()) {
                    HStack {
                        Image(systemName: "list.bullet.rectangle")
                        Text("Jobs by Type")
                    }
                    .padding(paddingLabelsJobs)
                    .overlay {
                        RoundedRectangle(cornerRadius: cornerRadiusRoundedRectangle)
                            .stroke(lineWidth: lineWidthStroke)

                    }
                }
                .accessibilityIdentifier("navItemType")
            }
        }
    }
}

#Preview {
    ContentViewFactory.create()
}
