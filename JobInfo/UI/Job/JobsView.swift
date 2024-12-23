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
                List {
                    ForEach(viewModel.jobs, id: \.self) { job in
                        
                        JobItemView(job: job)
                    }
                    .accessibilityIdentifier("forEachJobs")
                    
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
                try await viewModel.getJobs()
            }
        }
    }
}

#Preview {
    ContentViewFactory.create()
}