//
//  DetailView.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 9.01.2024.
//

import SwiftUI

struct DetailView: View {
    
    @State private var remainingTime = 8400
    @State private var circularBarTime: CGFloat = 0.5
    @StateObject var viewModel: SocketViewModel = SocketViewModel(socketService: SocketServices())
    var socketUpdateId: String
    
    var body: some View {
        ZStack {
            Text(formatTime(Int(viewModel.initialCountdownFloor))).fontWeight(.bold)
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
        //MARK: Updates the bar when viewModel initialCountdownFloor changes.
        .onChange(of: viewModel.initialCountdownFloor, { _, newValue in
            circularBarTime = CGFloat(newValue) / 8400
        })
        // MARK: Initialise socket connection at startup
        .onAppear {
            viewModel.socketConnect()
            viewModel.socketBegin(socketUpdateId: socketUpdateId)
        }
        //MARK: Ondissappear socket disconnect
        .onDisappear {
            viewModel.socketDisconnect()
        }
    }
}

#Preview {
    DetailView(socketUpdateId: "")
}
