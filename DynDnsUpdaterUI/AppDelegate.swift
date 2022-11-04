//
//  AppDelegate.swift
//  DynDnsUpdaterUI
//
//  Created by Privat Jörg Heinrich on 16.10.22.
//  Copyright © 2022 jfheinrich.eu. All rights reserved.
//

import Foundation
import SwiftUI

final class AppDelegate: NSObject, NSApplicationDelegate {
    private var menuExtrasConfigurator: MacExtrasConfigurator?
    
    
    // MARK: NSApplicationDelegate
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        menuExtrasConfigurator = .init()
    }
}
