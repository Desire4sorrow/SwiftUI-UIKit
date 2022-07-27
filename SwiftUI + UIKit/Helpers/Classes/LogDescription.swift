//
//  LogDescription.swift
//  City Guide
//
//  Created by Omega on 27.07.2022.
//

import Foundation

extension URLRequest {

    var logDescription: String {
        var debugText = "\n" + Date().formatted("dd.MM.yyyy HH:mm:ss") + "\n"
        let method = httpMethod ?? ""
        let url = url?.absoluteString ?? ""
        let headers = "Headers: \(allHTTPHeaderFields ?? [:])"
        debugText += "\n\(method) request: \(url)\n\(headers)"
        return debugText
    }
}
