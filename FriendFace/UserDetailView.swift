//
//  UserDetailView.swift
//  FriendFace
//
//  Created by Purnaman Rai (College) on 27/12/2025.
//

import SwiftUI

struct UserDetailView: View {
    let user: User
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                Image(systemName: "person.crop.circle.fill")
                    .foregroundStyle(Color.random.gradient)
                    .font(.system(size: 100))
                
                HStack {
                    Text(user.name)
                        .font(.title2.bold())
                    
                    ZStack {
                        Capsule()
                            .stroke(user.isActive ? .green : .gray, lineWidth: 2)
                            .frame(width: 50, height: 20)
                        Text(user.isActive ? "Online" : "Offline")
                            .font(.caption.bold())
                            .foregroundStyle(user.isActive ? .green : .gray)
                    }
                }
                
                HStack(spacing: 8) {
                    Image(systemName: "building.2.fill")
                    Text(user.company)
                    
                    Text("•")
                    
                    Image(systemName: "envelope.fill")
                    Text(user.email)
                    
                    Text("•")
                    
                    Image(systemName: "birthday.cake.fill")
                    Text(user.birthYear)
                    
                }
                .font(.caption)
                .foregroundStyle(.secondary)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(user.tags, id: \.self) { tag in
                            let randomColor = Color.random
                            
                            Text(tag)
                                .font(.footnote)
                                .fontWeight(.medium)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(
                                    Capsule()
                                        .fill(randomColor.opacity(0.1))
                                )
                                .foregroundStyle(randomColor)
                        }
                    }
                    .padding(.horizontal)
                }
                
                ZStack {
                    VStack(alignment: .leading, spacing: 20) {
                        VStack(alignment: .leading) {
                            Text("About")
                                .font(.headline)
                            Text(user.about)
                                .font(.subheadline)
                        }
                        
                        Divider()
                        
                        VStack(alignment: .leading, spacing: 8) {
                            HStack {
                                Image(systemName: "calendar")
                                    .foregroundStyle(.secondary)
                                Text(user.registered, format: .dateTime.year().month())
                            }
                            
                            HStack {
                                Image(systemName: "map")
                                    .foregroundStyle(.secondary)
                                Text(user.address)
                                    .lineLimit(1)
                            }
                        }
                        .font(.footnote)
                    }
                    .padding()
                    .background(
                        RoundedRectangle(cornerRadius: 20)
                            .fill(.secondary.opacity(0.1))
                    )
                }
                .padding()
            }
        }
    }
    
    init(for user: User) {
        self.user = user
    }
}

#Preview {
    UserDetailView(for: User.sampleUser)
}
