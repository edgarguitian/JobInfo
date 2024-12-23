//
//  JobsTypesView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 23/12/24.
//

import SwiftUI

struct JobsTypesView: View {
    @StateObject private var viewModel: JobsTypesViewModel

    init(viewModel: JobsTypesViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                if viewModel.showLoadingSpinner {
                    LoadingSpinnerView()
                } else {
                    ForEach(viewModel.types, id: \.self) { type in
                        
                        Text(type.name)
                            .padding(paddingLabelsJobs)
                            .overlay {
                                RoundedRectangle(cornerRadius: cornerRadiusRoundedRectangle)
                                    .stroke(lineWidth: lineWidthStroke)

                            }
                    }
                    .accessibilityIdentifier("forEachTypes")
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
        }
    }
}

#Preview {
    ContentViewFactory.create()
}
