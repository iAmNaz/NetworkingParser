//
//  ViewController.swift
//  NetworkingParser
//
//  Created by Nazario Mariano on 8/4/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func buttonTapped(_ sender: UIButton) {
        let network = Networking()
        network.fetchPosts()
        network.fetchTodos()
    }
    
}

