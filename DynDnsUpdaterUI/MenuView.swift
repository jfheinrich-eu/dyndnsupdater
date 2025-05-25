//
//  MenuView.swift
//  DynDnsUpdaterUI
//
//  Created by Privat Jörg Heinrich on 04.11.22.
//  Copyright © 2022 jfheinrich.eu. All rights reserved.
//

import SwiftUI
import DynDnsUpdaterLibrary

struct MenuView: View {
    private func update() -> String {
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

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
