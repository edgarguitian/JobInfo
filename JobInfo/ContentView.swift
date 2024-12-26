//
//  ContentView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import SwiftUI

struct ContentView: View {
    private let createRegionsView: CreateRegionsView
    private let createTypesView: CreateTypesView
    private let createCompanyTypesView : CreateCompanyTypesView
    
    init(createRegionsView: CreateRegionsView,
         createTypesView: CreateTypesView,
         createCompanyTypesView: CreateCompanyTypesView) {
        self.createRegionsView = createRegionsView
        self.createTypesView = createTypesView
        self.createCompanyTypesView = createCompanyTypesView
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 30) {

                NavigationLink(destination:
                                createRegionsView.create()) {
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
                                createTypesView.create()) {
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
                                createCompanyTypesView.create()) {
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
            .navigationTitle("Jobs")
        }
    }
}

#Preview {
    ContentViewFactory.create()
}
