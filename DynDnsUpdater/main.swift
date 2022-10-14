//
//  main.swift
//  DynDnsUpdater
//
//  Created by Privat Jörg Heinrich on 10.10.22.
//

import Foundation

import DynDnsUpdaterLibrary

var updater = DynDnsUpdaterLib(forIsCli: true)

signal(SIGINT) {
    theSignal in
    updater.writeToStderr("application interrupted -- halting")
        exit(EXIT_FAILURE)
}


var result = updater.update()

exit(EXIT_SUCCESS)
