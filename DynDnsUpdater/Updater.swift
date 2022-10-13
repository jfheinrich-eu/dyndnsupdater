//
//  Updater.swift
//  DynDnsUpdater
//
//  Created by Privat Jörg Heinrich on 11.10.22.
//  Copyright © 2022 jfheinrich.eu. All rights reserved.
//

import Foundation

class Updater
{
    let STD_ERR = FileHandle.standardError
    let STD_OUT = FileHandle.standardOutput

    let ipURI = "https://ipecho.net/plain"
    let updateURI = "https://carol.selfhost.de/update?username=478129&password=frefMeunn9&textmodi=1"

    var output = Output()
    var isCli = true

    func update()-> Bool {
        let externalIP = curl(ipURI)
        let uri = updateURI + "&myip=" + externalIP
        let response = curl(uri)

        writeSuccess("Dyn DNS Update: \(response)")
        return true
    }

    func writeToStdout(_ message: String) {
        let messageAsString = message + "\r\n"
        if let messageAsData: Data = messageAsString.data(using: .utf8) {
            self.STD_OUT.write(messageAsData)
        }
    }

    func curl(_ uri: String)->String {
        var contents = ""

        if let url = URL(string: uri) {

            do {
                contents = try String(contentsOf: url)
            } catch {
                self.reportErrorAndExit("Exception by get the content: \(error)")
            }

        } else {
            self.reportErrorAndExit("Bad URL: \(uri)")
        }

        return contents
    }

    func writeSuccess(_ message: String) {
        if self.isCli == true {
            writeToStdout(output.GREEN + output.BOLD + "OK " + output.RESET + message)
        }
    }

    func writeToStderr(_ message: String) {
        if self.isCli == true {
            let messageAsString = message + "\r\n"
            if let messageAsData: Data = messageAsString.data(using: .utf8) {
                self.STD_ERR.write(messageAsData)
            }
        }
    }

    func reportErrorAndExit(_ message: String, _ code: Int32 = EXIT_FAILURE) {
        if self.isCli == true {
            writeToStderr(output.RED + output.BOLD + "ERROR " + output.RESET + message + " -- exiting")
            exit(code)
        }
    }
}
