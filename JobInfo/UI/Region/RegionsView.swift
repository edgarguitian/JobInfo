//
//  JobsRegionsView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import SwiftUI

struct RegionsView: View {
    @StateObject private var viewModel: RegionsViewModel
    private let createJobsView: CreateJobsView

    init(viewModel: RegionsViewModel,
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
                                        createJobsView.create(filterID: region.id, filterType: .byRegion)) {
                            Text(region.name)
                                .padding(paddingLabelsJobs)
                                .overlay {
                                    RoundedRectangle(cornerRadius: cornerRadiusRoundedRectangle)
                                        .stroke(lineWidth: lineWidthStroke)

                                }
                        }
                        .accessibilityIdentifier("navItemJobsRegion")
                    }
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
            .navigationTitle(titleRegionsView)
        }
    }
}

#Preview {
    ContentViewFactory.create()
}
