//
//  PublicView.swift
//  MessengerClient
//
//  Created by Dan on 10/3/21.
//

import Foundation
import SwiftUI


struct PublicView: View
{
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var isLoginValid: Bool = false
    @State private var shouldShowLoginAlert: Bool = false
    @State private var response: String = ""
    var body: some View
    {
        NavigationView
        {
            VStack()
            {
                Spacer()
                Text("Welcome!")
                    .font(.system(size: 40, weight: .regular))
                    .foregroundColor(.black)
                HStack
                {
                    TextField("username", text: $username)
                        .disableAutocorrection(true)
                        .autocapitalization(.none)
                        .padding(.horizontal, 20)
                }
                .padding(.vertical, 20)
                .cornerRadius(5)
                .padding(.horizontal, 40)
                        .overlay(RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 1)
                                    .padding(.horizontal, 40)
                                    )

                HStack
                {
                    SecureField("password", text: $password)
                        .padding(.horizontal, 20)
                }
                .padding(.vertical, 20)
                .cornerRadius(5)
                .padding(.horizontal, 40)
                .overlay(RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.black, lineWidth: 1)
                            .padding(.horizontal, 40)
                            )
                NavigationLink(destination: HomePublic(item: response), isActive: $isLoginValid)
                {
                    Button(action:
                        {
                            let user: User = User(username: username, password: password)
                            let json = user.toJson()
                            let url = Settings.publicAPI + "auth/login"
                            Http().Post(address: url, content: json)
                            {
                                (Response) in
                            
                                response = Response
                                //print(response)
                                
                                let success = response.contains("success\":true") // i dont know how to parse json, yet.
//                              print(success)
                                if success {
                                  self.isLoginValid = true //trigger NavigationLink
                                }
                                else {
                                  self.shouldShowLoginAlert = true //trigger Alert
                                }
                                
                                        
                            }
                        })
                    {
                        Text("Sign in")
                            .fontWeight(.regular)
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 20)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                    }
                    
                   
                    
                }
                .navigationBarBackButtonHidden(true)
                Spacer()
                
                
            }
            .edgesIgnoringSafeArea(.all)
        }
        
        
    }
}

