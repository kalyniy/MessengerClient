import SwiftUI
import UIKit
import Foundation

class Http
{
    enum AuthenticationError: Error {
        case invalidCredentials
        case custom(errorMessage: String)
    }

    enum NetworkError: Error {
        case invalidURL
        case noData
        case decodingError
    }

    struct LoginRequestBody: Codable {
        let username: String
        let password: String
    }

    struct LoginResponse: Codable {
        let token: String?
        let user: UserDTO?
        let success: Bool?
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
    func LoginPost(address: String, content: String, completion: @escaping (Result<UserDTO, AuthenticationError>) -> Void)
    {
        let url = URL(string: address)!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Accept")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpBody = content.data(using: .utf8)

        let task = URLSession.shared.dataTask(with: request) {(data, response, error) in
            guard let data = data, error == nil else {
                            completion(.failure(.custom(errorMessage: "No data")))
                            return
                        }
                        
                        try! JSONDecoder().decode(LoginResponse.self, from: data)
                        
                        guard let loginResponse = try? JSONDecoder().decode(LoginResponse.self, from: data) else {
                            completion(.failure(.invalidCredentials))
                            return
                        }
                        
                        guard let user = loginResponse.user else {
                            completion(.failure(.invalidCredentials))
                            return
                        }
                        
                        completion(.success(user))
        }
        task.resume()
    }
}
