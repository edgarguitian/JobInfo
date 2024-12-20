//
//  LoadingSpinnerView.swift
//  JobInfo
//
//  Created by Edgar Guitian Rey on 19/12/24.
//

import SwiftUI

struct LoadingSpinnerView: View {
    @State private var animate = false
    @Environment(\.colorScheme) var colorScheme
    private var colorDefault: Color {
        colorScheme == .dark ? .white : .black
    }

    private var gradient: LinearGradient {
        LinearGradient(
            stops: [
                Gradient.Stop(color: colorDefault, location: 0.1),
                Gradient.Stop(color: colorDefault.opacity(0.8), location: 0.4),
                Gradient.Stop(color: colorDefault.opacity(0.4), location: 0.8)
            ],
            startPoint: .leading,
            endPoint: .trailing
        )
    }

    var body: some View {
        Circle()
            .stroke(gradient, lineWidth: 8)
            .frame(width: 80, height: 80)
            .rotationEffect(Angle(degrees: animate ? 360 : 0))
            .animation(
                .linear(duration: 1)
                .repeatForever(autoreverses: false),
                value: animate
            )
            .onAppear {
                withAnimation {
                    animate.toggle()
                }
            }
    }
}

#Preview {
    LoadingSpinnerView()
}
