//
//  JobsRegionsView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import SwiftUI

struct JobsRegionsView: View {
    @StateObject private var viewModel: JobsRegionsViewModel
    private let createJobsView: CreateJobsView

    init(viewModel: JobsRegionsViewModel,
         createJobsView: CreateJobsView) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.createJobsView = createJobsView
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if viewModel.showLoadingSpinner {
                    LoadingSpinnerView()
                } else {
                    ForEach(viewModel.regions, id: \.self) { region in
                        
                        NavigationLink(destination:
                                        createJobsView.create(regionID: region.id)) {
                            Text(region.name)
                                .padding(paddingLabelsJobs)
                                .overlay {
                                    RoundedRectangle(cornerRadius: cornerRadiusRoundedRectangle)
                                        .stroke(lineWidth: lineWidthStroke)

                                }
                        }
                        .accessibilityIdentifier("navItemRegion")
                    }
                    .accessibilityIdentifier("forEachRegions")
                }
            }
            .alert(isPresented: $viewModel.showError, content: {
                Alert(title: Text("Alert"),
                      message: Text(viewModel.errorMessage!),
                      dismissButton: .default(Text("OK"), action: {
                    exit(0)
                }))
            })
            .onAppear {
                Task {
                    try await viewModel.getInfoRegions()
                }
            }
        }
    }
}

#Preview {
    ContentViewFactory.create()
}
