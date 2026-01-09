//
//  Friend.swift
//  FriendFace
//
//  Created by Purnaman Rai (College) on 26/12/2025.
//

import Foundation

struct Friend: Codable, Hashable, Identifiable {
    let id: UUID
    let name: String
}
