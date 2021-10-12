//
//  UserRegister.swift
//  Switchy
//
//  Created by Dan on 7/20/21.
//

import Foundation

class UserRegister: Codable
{
    var alias: String
    var email: String
    var username: String
    var password: String
    var device: Device
    init(alias: String, email: String, username: String, password: String)
    {
        self.alias = alias
        self.email = email
        self.username = username
        self.password = password
        self.device = Device()
    }
    func toJson() -> String
    {
        do
        {
            let encoder = JSONEncoder()
            let data = try encoder.encode(self)
            guard let json = String(data: data, encoding: String.Encoding.utf8) else { return ""}
            return json
        }
        catch _
        {
            return ""
        }
    }
    
}
