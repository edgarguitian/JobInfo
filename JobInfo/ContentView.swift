//
//  ContentView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import SwiftUI

struct ContentView: View {
    private let createJobsByRegionView: CreateJobsByRegionView
    private let createJobsByTypeView: CreateJobsByTypeView
    private let createJobsByCompanyTypeView : CreateCompanyTypesView
    
    init(createJobsByRegionView: CreateJobsByRegionView,
         createJobsByTypeView: CreateJobsByTypeView,
         createJobsByCompanyTypeView: CreateCompanyTypesView) {
        self.createJobsByRegionView = createJobsByRegionView
        self.createJobsByTypeView = createJobsByTypeView
        self.createJobsByCompanyTypeView = createJobsByCompanyTypeView
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
                                createJobsByTypeView.create()) {
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
                
                NavigationLink(destination:
                                createJobsByCompanyTypeView.create()) {
                    HStack {
                        Image(systemName: "building")
                        Text("Jobs by Company Type")
                    }
                    .padding(paddingLabelsJobs)
                    .overlay {
                        RoundedRectangle(cornerRadius: cornerRadiusRoundedRectangle)
                            .stroke(lineWidth: lineWidthStroke)

                    }
                }
                .accessibilityIdentifier("navItemCompanyType")
            }
        }
    }
}

#Preview {
    ContentViewFactory.create()
}
