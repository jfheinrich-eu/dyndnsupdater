//
//  ContentView.swift
//  DynDnsUpdaterUI
//
//  Created by Privat Jörg Heinrich on 11.10.22.
//  Copyright © 2022 jfheinrich.eu. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            HStack {
                Button("Hello") {
                    _ = Alert(title: Text("Hallo"))
                }
            }
            .padding()
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
