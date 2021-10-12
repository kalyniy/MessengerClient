//
//  Device.swift
//  Switchy
//
//  Created by Dan on 7/11/21.
//

import Foundation
import UIKit
import SwiftUI

func findOS() -> String
{
    let os:String = UIDevice.current.systemVersion
    return os
}
func findName() -> String
{
    let name:String = UIDevice.current.name
    return name
}
func findID() -> String
{
    return  UIDevice.current.identifierForVendor!.uuidString
}
class Device: Codable
{
    var os: String
    var name: String
    var id: String
    init()
    {
        self.os = findOS()
        self.name = findName()
        self.id = findID()
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
