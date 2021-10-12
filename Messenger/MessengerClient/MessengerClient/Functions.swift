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
    func convertStringToDictionary(text: String) -> [String: String]? {
        if let data = text.data(using: .utf8) {
            do {
                let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String:String]
                return json
            } catch {
                print("Something went wrong")
            }
        }
        return nil
    }
}
