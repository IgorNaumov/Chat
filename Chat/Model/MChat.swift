//
//  MChat.swift
//  Chat
//
//  Created by nil on 18.05.2021.
//

import UIKit

struct Mchat: Hashable, Decodable {
    var username: String
    var userImageString: String
    var lastMessage: String
    var id: Int
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    static func == (lhs: Mchat, rhs: Mchat) -> Bool {
        return lhs.id == rhs.id
    }
}
