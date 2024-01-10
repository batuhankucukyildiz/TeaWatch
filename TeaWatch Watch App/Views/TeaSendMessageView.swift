//
//  TeaSendMessageView.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 8.01.2024.
//

import SwiftUI

struct TeaSendMessageView: View {
    var id: String
    var socketUpdateId: String
    var vmService = TeaSendMessageViewModel(service: TeaSendMessageService())
    @State private var isDetailViewActive = false

    var body: some View {
        NavigationStack {
            ScrollView {
                Color.black.ignoresSafeArea()
                
                VStack {
                    CustomButton(title: "Brew Tea", color: .green) {
                        vmService.teaBrew("ready\(id)")
                    }
                    .padding(.bottom)
                   
                        CustomButton(title: "Detail", color: .orange) {
                            self.isDetailViewActive = true
                        }
                        .padding(.bottom)
                        .background(NavigationLink("", destination: DetailView(socketUpdateId: socketUpdateId), isActive: $isDetailViewActive).hidden())

                    CustomButton(title: "Finish", color: .red) {
                        vmService.teaFinish("reset\(id)")
                    }
                }
                .padding(.horizontal)
            }
        }
    }
}


#Preview {
    TeaSendMessageView(id: "", socketUpdateId: "")
}
