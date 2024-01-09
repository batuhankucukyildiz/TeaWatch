//
//  DetailView.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 9.01.2024.
//

import SwiftUI

struct DetailView: View {
    @State private var remainingTime = 1200 // 20 dakika = 1200 saniye
    @State private var circularBarTime: CGFloat = 0.5
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let socket = SocketViewModel()
    var body: some View {
        ZStack {
            Text(formatTime(remainingTime)).fontWeight(.bold)
            CircularBar(progress: $circularBarTime)
                .scaleEffect(0.7)
                .alignmentGuide(HorizontalAlignment.center) { dimension in
                    dimension[.trailing] / 2 // Yatayda ortalamak için
                }
                .alignmentGuide(VerticalAlignment.center) { dimension in
                    dimension[.bottom] / 2 // Dikeyde ortalamak için
                }
        }
        .padding()
        .onReceive(timer) { _ in
            if remainingTime > 0 {
                circularBarTime = CGFloat(remainingTime) / CGFloat(1200)
                remainingTime -= 1
            }
        }
    }

    private func formatTime(_ seconds: Int) -> String {
        let minutes = seconds / 60
        let seconds = seconds % 60
        return String(format: "%02d:%02d", minutes, seconds)
    }
}

#Preview {
    DetailView()
}
