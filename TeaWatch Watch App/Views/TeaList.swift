//
//  TeaList.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 8.01.2024.
//

import SwiftUI

struct TeaList: View {
    
    var body: some View {
        NavigationStack {
            List {
                Section {
                    ForEach(TeaListModel.listModel, id:\.self) { item in
                        NavigationLink(destination: item.destination) {
                            HStack {
                                Image(systemName: item.imageName)
                                    .foregroundColor(item.imageColor)
                                Text(item.text)
                                    .foregroundStyle(.white)
                                    .fontWeight(.semibold)
                                    .opacity(0.9)
                                    .padding([.top, .bottom])
                                    .multilineTextAlignment(.leading)
                            }
                        }
                    }
                }
            header: {
                Text("Select Floor").foregroundStyle(.white)
            }
            footer: {
                VStack(alignment: .leading) {
                    Text("TeaWatch")
                    Text("V1.0")
                }
                .foregroundStyle(Color.white)
            }
            .listRowBackground(Color.clear)
            }
            .background( Color.black.ignoresSafeArea())
            .scrollContentBackground(.hidden)
            
        }.navigationBarHidden(true)
    }
}

#Preview {
    TeaList()
}
