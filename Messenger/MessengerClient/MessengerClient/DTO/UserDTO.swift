//
//  UserDTO.swift
//  MessengerClient
//
//  Created by Dan on 10/11/21.
//

import Foundation

class UserDTO: Codable
{
    var alias: String
    var email: String
    var username: String
    var devices: Array<Device>
    var friends: Array<String>
    var chats: Array<String>
    init()
    {
        alias = ""
        email = ""
        username = ""
        devices = []
        friends = []
        chats = []
    }
    init(alias: String, email: String, username: String,
        devices: Array<Device>, friends: Array<String>, chats: Array<String>)
    {
        self.alias = alias
        self.email = email
        self.username = username
        self.devices = devices
        self.friends = friends
        self.chats = chats
    }
    static func toUserDTO(json: String) -> UserDTO
    {
        
        return UserDTO(alias: "String", email: "", username: "", devices: [], friends: [], chats: [])
    }
}
