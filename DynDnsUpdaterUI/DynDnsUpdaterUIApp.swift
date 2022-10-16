//
//  DynDnsUpdaterUIApp.swift
//  DynDnsUpdaterUI
//
//  Created by Privat Jörg Heinrich on 11.10.22.
//  Copyright © 2022 jfheinrich.eu. All rights reserved.
//

import SwiftUI
import AppKit

@main
struct DynDnsUpdaterUIApp: App {
    
    @NSApplicationDelegateAdaptor(AppDelegate.self)
    private var appDelegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
