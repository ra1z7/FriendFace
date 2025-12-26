//
//  ContentView.swift
//  FriendFace
//
//  Created by Purnaman Rai (College) on 26/12/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var users = [User]()
    
    var body: some View {
        NavigationStack {
            List(users) { user in
                HStack(spacing: 14) {
                    Image(systemName: "person.crop.circle.fill")
                        .foregroundStyle(randomColor().gradient)
                        .font(.largeTitle)
                        .imageScale(.large)
                    
                    VStack(alignment: .leading) {
                        Text(user.name)
                            .font(.headline)
                        
                        HStack {
                            Circle()
                                .fill(user.isActive ? Color.green.gradient : Color.gray.gradient)
                                .frame(width: 10, height: 10)
                            
                            Text(user.isActive ? "Online" : "Offline")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        }
                    }
                }
            }
            .navigationTitle("FriendFace")
        }
        .task {
            if users.isEmpty {
                if let fetchedUsers = await User.fetchUsers() {
                    users = fetchedUsers
                }
            }
        }
    }
    
    func randomColor() -> Color {
        let colors: [Color] = [
            .red, .orange, .yellow, .green, .blue, .purple, .pink, .gray, .mint, .teal, .cyan, .indigo, .brown,
        ]
        
        return colors.randomElement()!
    }
}

#Preview {
    ContentView()
}
