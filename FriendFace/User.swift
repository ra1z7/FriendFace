//
//  User.swift
//  FriendFace
//
//  Created by Purnaman Rai (College) on 26/12/2025.
//

import Foundation

struct User: Decodable, Hashable, Identifiable {
    let id: UUID
    let isActive: Bool
    let name: String
    let age: Int
    let company: String
    let email: String
    let address: String
    let about: String
    let registered: Date
    let tags: [String]
    let friends: [Friend]
    
    enum CodingKeys: CodingKey {
        case id
        case isActive
        case name
        case age
        case company
        case email
        case address
        case about
        case registered
        case tags
        case friends
    }
    
    static func fetchUsers() async -> [User]? {
        guard let url = URL(string: "https://www.hackingwithswift.com/samples/friendface.json") else {
            print("Invalid URL!")
            return nil
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let jsonDecoder = JSONDecoder()
            jsonDecoder.dateDecodingStrategy = .iso8601
            let decodedUsers = try jsonDecoder.decode([User].self, from: data)
            
            return decodedUsers
        } catch {
            print("Unable to fetch users: \(error.localizedDescription)")
            return nil
        }
    }
}

extension User {
    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        let idAsString = try container.decode(String.self, forKey: .id)
        self.id = UUID(uuidString: idAsString)!
        
        self.isActive = try container.decode(Bool.self, forKey: .isActive)
        self.name = try container.decode(String.self, forKey: .name)
        self.age = try container.decode(Int.self, forKey: .age)
        self.company = try container.decode(String.self, forKey: .company)
        self.email = try container.decode(String.self, forKey: .email)
        self.address = try container.decode(String.self, forKey: .address)
        self.about = try container.decode(String.self, forKey: .about)
        self.registered = try container.decode(Date.self, forKey: .registered)
        self.tags = try container.decode([String].self, forKey: .tags)
        self.friends = try container.decode([Friend].self, forKey: .friends)
    }
    
    static let sampleUser = User(
        id: UUID(),
        isActive: true,
        name: "Alford Rodriguez",
        age: 21,
        company: "Imkan",
        email: "alfordrodriguez@imkan.com",
        address: "907 Nelson Street, Cotopaxi, South Dakota, 5913",
        about: "Occaecat consequat elit aliquip magna laboris dolore laboris sunt officia adipisicing reprehenderit sunt. Do in proident consectetur labore. Laboris pariatur quis incididunt nostrud labore ad cillum veniam ipsum ullamco. Dolore laborum commodo veniam nisi. Eu ullamco cillum ex nostrud fugiat eu consequat enim cupidatat. Non incididunt fugiat cupidatat reprehenderit nostrud eiusmod eu sit minim do amet qui cupidatat. Elit aliquip nisi ea veniam proident dolore exercitation irure est deserunt.",
        registered: Date.now,
        tags: [
            "cillum",
            "consequat",
            "deserunt",
            "nostrud",
            "eiusmod",
            "minim",
            "tempor",
        ],
        friends: [
            Friend(id: UUID(), name: "Hawkins Patel"),
            Friend(id: UUID(), name: "Jewel Sexton"),
            Friend(id: UUID(), name: "Berger Robertson"),
            Friend(id: UUID(), name: "Hess Ford"),
            Friend(id: UUID(), name: "Bonita White"),
            Friend(id: UUID(), name: "Sheryl Robinson"),
            Friend(id: UUID(), name: "Karin Collins"),
            Friend(id: UUID(), name: "Pace English"),
            Friend(id: UUID(), name: "Pauline Dawson"),
            Friend(id: UUID(), name: "Russo Carlson"),
            Friend(id: UUID(), name: "Josefina Rivas")
        ]
    )
    
    var birthYear: String {
        String(Calendar.current.component(.year, from: Date()) - age)
    }
}
