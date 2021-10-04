//
//  PublicView.swift
//  MessengerClient
//
//  Created by Dan on 10/3/21.
//

import Foundation
import SwiftUI

func login() -> Void
{
    print("Hello")
}
struct PublicView: View
{
    @State private var username: String = ""
    @State private var password: String = ""
    var body: some View
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
            Button(action: login)
            {
                Text("Sign in")
                    .fontWeight(.regular)
                    .font(.title)
                    .foregroundColor(.black)
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.black, lineWidth: 1)
            )
            Spacer()
            
            
        }
        .edgesIgnoringSafeArea(.all)
        
    }
}

