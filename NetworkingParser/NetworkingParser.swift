//
//  NetworkingParser.swift
//  NetworkingParser
//
//  Created by OPSolutions PH on 8/4/21.
//

import Foundation

let commentsURL = "https://jsonplaceholder.typicode.com"

class NetworkingParser: API {
    func fetchComments() {
        let session = URLSession (configuration: .default)
        let url = URL(string: "\(commentsURL)/comments")
        
        guard let url = url else {
            return
        }
        
        let task = session.dataTask(with: url){ data, _, error in
            
            do{
                let jsonDecoder = JSONDecoder()
                
                let comments = try jsonDecoder.decode([Comment].self, from: data!)
                
                for comment in comments {
                    print("PostID: \(comment.postId) \n ID: \(comment.id) \n \(comment.name) \n \(comment.email) \n \(comment.body)")
                }
                
            }
            catch{
                print(error)
            }
        }
        
        task.resume()
    }
}

struct Comment: Codable {
    let postId: Int
    let id: Int
    let name: String
    let email: String
    let body: String
}
