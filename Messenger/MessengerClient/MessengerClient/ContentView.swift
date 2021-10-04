//
//  ContentView.swift
//  MessengerClient
//
//  Created by Dan on 10/3/21.
//

import SwiftUI
import UIKit
func printHello(text: String) -> Void
{
    print(text)
}
struct ContentView: View {
    @State private var name = ""

    var body: some View
    {
        NavigationView
        {
            VStack
            {
                NavigationLink(destination: PublicView())
                {
                    Text("Default server")
                        .fontWeight(.regular)
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
                NavigationLink(destination: PrivateView())
                {
                    Text("Private server")
                        .fontWeight(.regular)
                        .font(.title)
                        .foregroundColor(.white)
                        .padding()
                        .background(Color.black)
                        .cornerRadius(20.0)
                        .overlay(
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.black, lineWidth: 1)
                        )
                }
            }
            
            .navigationBarTitle(Text("Start"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .padding()
    }
}
