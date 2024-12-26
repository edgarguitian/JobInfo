//
//  JobsView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import SwiftUI

struct JobsView: View {
    @StateObject private var viewModel: JobsViewModel
    let filterType: JobFilter

    init(viewModel: JobsViewModel,
         filterType: JobFilter) {
        self._viewModel = StateObject(wrappedValue: viewModel)
        self.filterType = filterType
    }
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if viewModel.showLoadingSpinner {
                    LoadingSpinnerView()
                } else {
                    List {
                        ForEach(viewModel.jobs, id: \.self) { job in
                            
                            JobItemView(job: job)
                        }
                        
                    }
                    .accessibilityIdentifier("listJobs")
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
                    try await viewModel.getJobs()
                }
            }
            .navigationTitle(setNavigationTitleFromFilterType())
        }
    }
    
    private func setNavigationTitleFromFilterType() -> String {
        switch filterType {
        case .byRegion:
            "Jobs by Region"
        case .byCompanyType:
            "Jobs by Company Type"
        case .byType:
            "Jobs by Type"
        }
    }
}

#Preview {
    ContentViewFactory.create()
}
