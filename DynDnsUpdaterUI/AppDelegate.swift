//
//  AppDelegate.swift
//  DynDnsUpdaterUI
//
//  Created by Privat Jörg Heinrich on 16.10.22.
//  Copyright © 2022 jfheinrich.eu. All rights reserved.
//

import Foundation
import AppKit
import SwiftUI
import DynDnsUpdaterLibrary

final class AppDelegate: NSObject, NSApplicationDelegate {
    private var menuExtrasConfigurator: MacExtrasConfigurator?
    
    final private class MacExtrasConfigurator: NSObject {
        private var statusBar: NSStatusBar
        private var statusItem: NSStatusItem
        private var mainView: NSView
                
        private struct MenuView: View {
            private func update()->String {
                var updater = DynDnsUpdaterLib(forIsCli: false)
                
                _ = updater.update()
                
                return updater.response
            }

            var body: some View {
                HStack {
                    Text(update())
                    Spacer()
                }
                .background(Color.blue)
                .padding()
            }
        }
        
        override init() {
            statusBar = NSStatusBar.system
            statusItem = statusBar.statusItem(withLength: NSStatusItem.squareLength)
            mainView = NSHostingView(rootView: MenuView())
            mainView.frame = NSRect(x: 0, y: 0, width: 300, height: 250)
            
            super.init()
            
            createMenu()
        }
        
        private func createMenu() {
            if let statusBarButton = statusItem.button {
                statusBarButton.image = NSImage(
                    systemSymbolName: "hammer", accessibilityDescription: nil
                )
                
                let groupMenuItem = NSMenuItem()
                groupMenuItem.title = "Group"
                
                let groupDetailsMenuItem = NSMenuItem()
                groupDetailsMenuItem.view = mainView
                
                let groupSubmenu = NSMenu()
                groupSubmenu.addItem(groupDetailsMenuItem)
                
                let mainMenu = NSMenu()
                mainMenu.addItem(groupMenuItem)
                mainMenu.setSubmenu(groupSubmenu, for: groupMenuItem)
                
                let secondMenuItem = NSMenuItem()
                secondMenuItem.title = "Another Item"
                
                let secondSubMenuItem = NSMenuItem()
                secondSubMenuItem.title = "SubItem"
                secondSubMenuItem.target = self
                secondSubMenuItem.action = #selector(Self.onItemClick(_:))
                
                let secondSubMenu = NSMenu()
                secondSubMenu.addItem(secondSubMenuItem)
                
                mainMenu.addItem(secondMenuItem)
                mainMenu.setSubmenu(secondSubMenu, for: secondMenuItem)
                
                let rootItem = NSMenuItem()
                rootItem.title = "One more action"
                rootItem.target = self
                rootItem.action = #selector(Self.rootAction(_:))
                
                mainMenu.addItem(rootItem)
                
                statusItem.menu = mainMenu
            }
        }
        
        @objc private func onItemClick(_ sender: Any?) {
            print("Hi form action")
        }
        
        @objc private func rootAction(_ sender: Any?) {
            print("Hi from root Action")
        }
    }
    
    // MARK: NSApplicationDelegate
    
    func applicationDidFinishLaunching(_ notification: Notification) {
        menuExtrasConfigurator = .init()
    }
}
