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
    @State private var countdownFloorTwo: Double = 0 // Yeni eklenen @State özelliği
    @StateObject var viewModel: SocketViewModel = SocketViewModel()

    var body: some View {
        ZStack {
            VStack {
                Text("Countdown: \(Int(viewModel.initialCountdownFloorTwo))")
                CustomButton(title: "tıkla", color: .green) {
                    viewModel.socketBegin()
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
        .onChange(of: viewModel.initialCountdownFloorTwo) {_, newValue in
            self.remainingTime = Int(newValue)
        }
//        .onDisappear {
//            viewModel.socketDisconnect()
//            //print("k")
//        }

//        .onReceive(socket.$initialCountdownFloorTwo) { newValue in
//            // Yeni değeri countdownFloorTwo özelliğine atayarak izlemeyi tetikle
//            self.countdownFloorTwo = newValue
//        }
    }
}


//socket.onCountdownUpdate = { [weak self] data in
//    DispatchQueue.main.async {
//        self?.initialCountdownFloorTwo = data
//        print("Data is --------------------------- \(data)")
//    }
//}
#Preview {
    DetailView()
}
