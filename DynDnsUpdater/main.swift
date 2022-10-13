//
//  main.swift
//  DynDnsUpdater
//
//  Created by Privat Jörg Heinrich on 10.10.22.
//

import Foundation



signal(SIGINT) {
    theSignal in
    Updater().writeToStderr("application interrupted -- halting")
        exit(EXIT_FAILURE)
}

let updater = Updater()

var result = updater.update()

exit(EXIT_SUCCESS)
