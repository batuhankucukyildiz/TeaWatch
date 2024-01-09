//
//  TeaSendMessageView.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 8.01.2024.
//

import SwiftUI

struct TeaSendMessageView: View {
    var body: some View {
        Color.black.ignoresSafeArea()
        VStack {
            CustomButton(title: "Brew Tea", color: .green) {
                
            }.padding(.bottom)
            CustomButton(title: "Finish", color: .red) {
                
            }.padding(.bottom)
        }
        .padding()
    }
}

#Preview {
    TeaSendMessageView()
}
