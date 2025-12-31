//
//  ContentView.swift
//  FriendFace
//
//  Created by Purnaman Rai (College) on 26/12/2025.
//

import SwiftUI

struct ContentView: View {
    @State private var allUsers = [User]()
    
    var body: some View {
        NavigationStack {
            List(allUsers) { user in
                NavigationLink(value: user) {
                    HStack(spacing: 14) {
                        Image(systemName: "person.crop.circle.fill")
                            .foregroundStyle(Color.random.gradient)
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
            }
            .navigationTitle("FriendFace")
            .navigationDestination(for: User.self) { selectedUser in
                UserDetailView(forID: selectedUser.id, from: allUsers)
            }
        }
        .task {
            if allUsers.isEmpty {
                if let fetchedUsers = await User.fetchUsers() {
                    allUsers = fetchedUsers
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
