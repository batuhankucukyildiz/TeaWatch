//
//  TeaListView.swift
//  TeaWatch Watch App
//
//  Created by Batuhan Küçükyıldız on 8.01.2024.
//

import SwiftUI

struct SettingsListModel: Hashable {
    var id: UUID = UUID()
    var imageName: String
    var text: String
    var imageColor: Color
    var destination: AnyView
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: SettingsListModel, rhs: SettingsListModel) -> Bool {
          return lhs.id == rhs.id
      }

    static let listModel: Array<SettingsListModel> = [
        SettingsListModel(
            imageName: "1.lane",
            text: "Floor One",
            imageColor: .yellow,
            destination: AnyView(TeaSendMessageView())
        ),
        SettingsListModel(
            imageName: "2.lane",
            text: "Floor Two",
            imageColor: .yellow,
            destination: AnyView(TeaSendMessageView())
        ),
        SettingsListModel(
            imageName: "3.lane",
            text: "FloorThree",
            imageColor: .yellow,
            destination: AnyView(TeaSendMessageView())
        ),
        
    ]
}

