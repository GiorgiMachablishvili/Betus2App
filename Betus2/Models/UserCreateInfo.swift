//
//  UserInfo.swift
//  Betus2
//
//  Created by Gio's Mac on 06.01.25.
//

import UIKit

public struct UserCreateInfo: Codable {
    let id: String
    let appleToken: String
    let pushToken: String
    let createdAt: String

    enum CodingKeys: String, CodingKey {
        case id
        case appleToken = "auth_token"
        case pushToken = "push_token"
        case createdAt = "created_at"
    }
}
