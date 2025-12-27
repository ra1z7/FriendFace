//
//  ExtensionColor.swift
//  FriendFace
//
//  Created by Purnaman Rai (College) on 27/12/2025.
//

import SwiftUI

extension Color {
    static var random: Color {
        let colors: [Color] = [
            .red, .orange, .yellow, .green, .blue,
            .purple, .pink, .gray, .mint, .teal,
            .cyan, .indigo, .brown
        ]
        
        return colors.randomElement()!
    }
}
