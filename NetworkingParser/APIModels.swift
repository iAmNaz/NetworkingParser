//
//  TodoNetworking.swift
//  NetworkingParser
//
//  Created by OPSolutions on 8/4/21.
//

import Foundation

struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}

struct Album: Codable {
    let userId: Int
    let id: Int
    let title: String
}
