//
//  ContentView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import SwiftUI

struct ContentView: View {
    private let createJobsByRegionView: CreateJobsByRegionView
    
    init(createJobsByRegionView: CreateJobsByRegionView) {
        self.createJobsByRegionView = createJobsByRegionView
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                
                NavigationLink(destination:
                                createJobsByRegionView.create()) {
                    Text("Jobs by Region")
                }
                .accessibilityIdentifier("navItemDialplan")
                
                Button("Jobs by language") {
                    
                }
                
                Button("Jobs by type") {
                    
                }
            }
        }
    }
}

#Preview {
    ContentViewFactory.create()
}
