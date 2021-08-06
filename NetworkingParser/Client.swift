//
//  Client.swift
//  NetworkingParser
//
//  Created by Nazario Mariano on 8/6/21.
//

import Foundation

class Client: DelegateProtocol {
    func didReceive(models: [Codable]) {
        debugPrint(models)
    }
}
