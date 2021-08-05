//
//  TodoNetworking.swift
//  NetworkingParser
//
//  Created by OPSolutions on 8/4/21.
//

import Foundation

let baseURL = "https://jsonplaceholder.typicode.com"

class Networking: API {
    func fetchPosts() {
        let session = URLSession(configuration: .default)
        let url = URL(string: "\(baseURL)/todos")
        
        guard let url = url else {
            return
        }
        
        let task = session.dataTask(with: url) { data, _, error in
            do {
                let jsonDecoder = JSONDecoder()
                let todos = try jsonDecoder.decode([Todo].self, from: data!)
                for todo in todos {
                    print("Id \(todo.id) \n title \(todo.title)")
                }
            }
            
            catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
struct Todo: Codable {
    let userId: Int
    let id: Int
    let title: String
    let completed: Bool
}
