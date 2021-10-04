//
//  PrivateView.swift
//  MessengerClient
//
//  Created by Dan on 10/3/21.
//

// PrivateView is a View for choosing a Private (independent) server

import Foundation
import SwiftUI

struct PrivateServer: Identifiable {
    let id = UUID()
    let name: String
    let address: String
}

// A view that shows the data for one Restaurant.
struct PrivateServerRow: View {
    var server: PrivateServer

    var body: some View {
        Text("\(server.name)")
    }
}
func delete(at offsets: IndexSet) {
    // delete the objects here

}

struct PrivateView: View
{
   @State private var servers = [
        PrivateServer(name: "Ownage", address: "https://ownage.pro/api/"),
        PrivateServer(name: "Dreamakers", address: "https://dreamakers.pro/api/"),
        PrivateServer(name: "Arbalet", address: "https://arbaletcup.ru/api/")
    ]
    var body: some View
    {
        
        TabView
        {
            List(servers)
            {
                server in PrivateServerRow(server: server)
                
            }
            .tabItem
            {
                Image(systemName: "cloud.fill")
                Text("Servers")
            }.padding(10)
            Text("Add")
              
                
            .tabItem
            {
                    Image(systemName: "plus.app")
                    Text("Add")
            }
            
        }
    }
}

