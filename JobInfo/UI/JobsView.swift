//
//  JobsView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 20/12/24.
//

import SwiftUI

struct JobsView: View {
    @StateObject private var viewModel: JobsViewModel

    init(viewModel: JobsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }
    
    var body: some View {
        VStack(spacing: 20) {
            if viewModel.showLoadingSpinner {
                LoadingSpinnerView()
            } else {
                ForEach(viewModel.jobs, id: \.self) { job in
                    
                    Text(job.title)
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
                try await viewModel.getJobs()
            }
        }
    }
}

#Preview {
    ContentViewFactory.create()
}
