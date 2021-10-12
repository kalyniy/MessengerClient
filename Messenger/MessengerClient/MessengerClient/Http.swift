import SwiftUI
import UIKit
import Foundation

struct Test: Codable, Identifiable
{
    var id = UUID()
    var title: String
    var body: String
}
class Http
{
    func Get(completion: @escaping ([Test]) -> ())
    {
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {return}
        URLSession.shared.dataTask(with: url)
        {
            (data,_, _) in
            let posts = try! JSONDecoder().decode([Test].self, from: data!)
            DispatchQueue.main.async {
                completion(posts)
            }
        }
        .resume()
    }
    func Post(address: String, content: String, completion: @escaping (String) -> ())
    {
        let url = URL(string: address)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = content.data(using: .utf8)

        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data else
            {
                print("Data not received!!")
                return
            }
            let receivedData = String(decoding: data, as: UTF8.self)
            DispatchQueue.main.async
            {
                completion(receivedData)
            }
        }
        task.resume()
    }
}
