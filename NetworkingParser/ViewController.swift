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
        let activityIndicator = UIActivityIndicatorView(style: .large)
        activityIndicator.startAnimating()
        
        self.view.addSubview(activityIndicator)
        
        network.fetch(resource: "todos", model: Todo.self) { results in
            print(results)
        }
    }
}

