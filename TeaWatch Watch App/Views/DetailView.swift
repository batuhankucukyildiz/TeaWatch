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
    @State private var countdownFloorTwo: Double = 0
    @StateObject var viewModel: SocketViewModel = SocketViewModel()
    var socketUpdateId: String
    
    var body: some View {
        ZStack {
            VStack {
                Text("Countdown: \(Int(viewModel.initialCountdownFloor))")
                CustomButton(title: "tıkla", color: .green) {
                    viewModel.socketBegin(socketUpdateId: socketUpdateId)
                }
            }
          
            
//            Text(formatTime(remainingTime)).fontWeight(.bold)
//            CircularBar(progress: $circularBarTime)
//                .scaleEffect(0.7)
//                .alignmentGuide(HorizontalAlignment.center) { dimension in
//                    dimension[.trailing] / 2 // Yatayda ortalamak için
//                }
//                .alignmentGuide(VerticalAlignment.center) { dimension in
//                    dimension[.bottom] / 2 // Dikeyde ortalamak için
//                }
        }
        .padding()
        .onAppear {
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
