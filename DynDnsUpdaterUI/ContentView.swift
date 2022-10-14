//
//  ContentView.swift
//  DynDnsUpdaterUI
//
//  Created by Privat Jörg Heinrich on 11.10.22.
//  Copyright © 2022 jfheinrich.eu. All rights reserved.
//

import SwiftUI
import DynDnsUpdaterLibrary

func update()->String {
    var updater = DynDnsUpdaterLib(forIsCli: false)
    
    _ = updater.update()
    
    return updater.response
}

struct ContentView: View {
    var body: some View {
        HStack {
            VStack {
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundColor(.accentColor)
                
                Text(update())
            }
            .padding()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
