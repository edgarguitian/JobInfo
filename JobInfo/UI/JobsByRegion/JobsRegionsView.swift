//
//  JobsRegionsView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import SwiftUI

struct JobsRegionsView: View {
    @StateObject private var viewModel: JobsRegionsViewModel

    init(viewModel: JobsRegionsViewModel) {
        self._viewModel = StateObject(wrappedValue: viewModel)
    }

    var body: some View {
        VStack {
            if viewModel.showLoadingSpinner {
                LoadingSpinnerView()
            } else {
                ForEach(viewModel.regions, id: \.self) { region in
                    Text(region.name)
                    /*NavigationLink(destination:
                                    createDialplanDetail.create(jokeDialplan: dialplan)) {
                        DialplanItemView(item: dialplan,
                                         position: index,
                                         soundPlayer: soundPlayer,
                                         currentlyPlayingId: $viewModel.currentPlayingDialplanId)
                            .id(dialplan.id)
                    }
                    .accessibilityIdentifier("navItemRegion")*/
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

#Preview {
    ContentViewFactory.create()
}
