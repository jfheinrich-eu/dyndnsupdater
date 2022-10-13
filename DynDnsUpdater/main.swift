//
//  main.swift
//  DynDnsUpdater
//
//  Created by Privat Jörg Heinrich on 10.10.22.
//

import Foundation
import DynDnyUpdaterLib

var dynDnsUpdater = DynDnyUpdaterLib()

signal(SIGINT) {
    theSignal in
    dynDnsUpdater.
    
        .writeToStderr("application interrupted -- halting")
        exit(EXIT_FAILURE)
}

let updater = Updater()

var result = updater.update()

exit(EXIT_SUCCESS)
