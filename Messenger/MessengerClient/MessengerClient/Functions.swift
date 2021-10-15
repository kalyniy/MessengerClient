//
//  Functions.swift
//  MessengerClient
//
//  Created by Dan on 10/11/21.
//

import Foundation
import SwiftUI

class Functions
{
    static func convertStringToDictionary(text: String) -> [String: AnyObject]? {
        if let data = text.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:AnyObject]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
}
