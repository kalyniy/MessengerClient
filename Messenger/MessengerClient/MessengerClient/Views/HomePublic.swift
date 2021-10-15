//
//  HomePublic.swift
//  MessengerClient
//
//  Created by Dan on 10/11/21.
//

import Foundation
import SwiftUI

struct HomePublic: View {
    @State var searchPrompt: String
    @State var isEditing = false
    
    
    let userDTO: UserDTO
    
    var body: some View
    {
        
        ZStack
        {
            Color(red: 230/255, green: 250/255, blue: 255/255).ignoresSafeArea()
            VStack
            {
                HStack
                {
                    TextField("Search ...", text: $searchPrompt)
                    .padding(7)
                    .padding(.horizontal, 25)
                    .background(Color(.systemGray6))
                    .cornerRadius(8)
                    .padding(.horizontal, 10)
                    .onTapGesture {
                        self.isEditing = true
                    }
                    if isEditing
                    {
                        Button(action:
                            {
                                self.isEditing = false
                                self.searchPrompt = ""
             
                            })
                        {
                            Text("Cancel")
                        }
                        .padding(.trailing, 10)
                        .transition(.move(edge: .trailing))
                        .animation(.default)
                    }
                }
                Spacer()
                Text("Hello \(userDTO.username)")
            }
            
        }.navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        
    }
}
