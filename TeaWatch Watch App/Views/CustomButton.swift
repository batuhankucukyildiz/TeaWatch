//
//  CustomButton.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 8.01.2024.
//

import SwiftUI

struct CustomButton: View {
    var title: String
    var color: Color
    var onClick: () -> ()
    var body: some View {
        Button(action: {
            onClick()
        }) {
            Text(title)
                .font(.title3)
                .fontWeight(.semibold)
                .padding(.top, 10)
                .padding(.bottom, 10)
                .foregroundColor(.white)
        }.background(color).cornerRadius(20)
//        .background(
//            Rectangle()
//                .fill(color.opacity(0.5))
//                .cornerRadius(20)
//                .frame(width: 320, height: 50)
//        )
    }
}
