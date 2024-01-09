//
//  CircularBar.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 9.01.2024.
//

import Foundation
import SwiftUI

struct CircularBar: View {
  @Binding var progress: CGFloat

  var body: some View {
    VStack {
      CircularProgressView(progress: progress)
        .frame(width: 200, height: 200) // adjust size as needed
    }
  }
}

struct CircularProgressView: View {
  var progress: CGFloat

  var body: some View {
    ZStack {
      // Background for the progress bar
      Circle()
        .stroke(lineWidth: 20)
        .opacity(0.1)
        .foregroundColor(.blue)

      // Foreground or the actual progress bar
      Circle()
        .trim(from: 0.0, to: min(progress, 1.0))
        .stroke(style: StrokeStyle(lineWidth: 20, lineCap: .round, lineJoin: .round))
        .foregroundColor(.blue)
        .rotationEffect(Angle(degrees: 270.0))
        .animation(.linear, value: progress)
    }
  }
}


//#Preview(body: {
//    CircularBar(progress: 0.1)
//        .scaleEffect(0.7)
//        .alignmentGuide(HorizontalAlignment.center) { dimension in
//            dimension[.trailing] / 2 // Yatayda ortalamak için
//        }
//        .alignmentGuide(VerticalAlignment.center) { dimension in
//            dimension[.bottom] / 2 // Dikeyde ortalamak için
//        }
//})
