//
//  Networking.swift
//  NetworkingParser
//
//  Created by OPSolutions on 8/4/21.
//

import Foundation

let baseURL = "https://jsonplaceholder.typicode.com"

class Networking: API {
    func fetchPosts() {
        //https://jsonplaceholder.typicode..com/albums
        let session = URLSession(configuration: .default)
        let url = URL(string: "\(baseURL)/albums")
        
        guard let url = url else {
            return
        }
        
        let task = session.dataTask(with: url) { data, _, error in
            do {
                let jsonDecoder = JSONDecoder()
                
                let albums = try jsonDecoder.decode([Album].self, from: data!)
                
                for album in albums {
                    print("Title: \(album.title)")
                }
            }catch {
                print(error)
            }
        }
        
        task.resume()
    }
    
    func fetchTodos() {
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
            }catch {
                print(error)
            }
        }
        
        task.resume()
    }
}
