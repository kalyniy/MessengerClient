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
    @State private var userDTO: UserDTO = UserDTO()
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
                NavigationLink(destination: HomePublic(searchPrompt: "", isEditing: true, userDTO: userDTO), isActive: $isLoginValid)
                {
                    Button(action:
                        {
                            let user: User = User(username: username, password: password)
                            let json = user.toJson()
                            let url = Settings.publicAPI + "auth/login"
                            Http().LoginPost(address: url, content: json)
                            {
                                result in
                               switch result {
                                   case .success(let user):
                                        userDTO = user
                                       DispatchQueue.main.async {
                                           isLoginValid = true
                                       }
                                   case .failure(let error):
                                       print(error.localizedDescription)
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

