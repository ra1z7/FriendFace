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
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
        .task {
            if let fetchedUsers = await User.fetchUsers() {
                users = fetchedUsers
            }
        }
    }
}

#Preview {
    ContentView()
}
