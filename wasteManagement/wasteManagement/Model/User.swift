//
//  User.swift
//  wasteManagement
//
//  Created by Aknur Seidazym on 10.05.2024.
//

import Foundation

struct User: Identifiable, Codable{
    let id: String
    let username: String
    let email: String
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, username: "pokonti", email: "pok.pokova@bk.ru")
}
