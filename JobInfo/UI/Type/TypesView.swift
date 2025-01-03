//
//  JobsTypesView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import SwiftUI

struct TypesView: View {
    @StateObject private var viewModel: TypesViewModel
    private let createJobsView: CreateJobsView

    init(viewModel: TypesViewModel,
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
                    ForEach(viewModel.types, id: \.self) { type in
                        
                        NavigationLink(destination:
                                        createJobsView.create(filterID: type.id, filterType: .byType)) {
                            Text(type.name)
                                .padding(paddingLabelsJobs)
                                .overlay {
                                    RoundedRectangle(cornerRadius: cornerRadiusRoundedRectangle)
                                        .stroke(lineWidth: lineWidthStroke)

                                }
                        }
                        .accessibilityIdentifier("navItemJobsType")
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
                    try await viewModel.getInfoTypes()
                }
            }
            .navigationTitle(titleTypesView)
        }
    }
}

#Preview {
    ContentViewFactory.create()
}
