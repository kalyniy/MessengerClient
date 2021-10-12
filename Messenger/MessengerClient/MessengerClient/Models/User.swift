//
//  User.swift
//  Switchy
//
//  Created by Dan on 7/11/21.
//

import Foundation

class User: Codable
{
    var username: String
    var password: String
    var device: Device
    init(username: String, password: String)
    {
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
