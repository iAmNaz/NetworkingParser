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
        // Do any additional setup after loading the view.
        
    }

    @IBAction func buttonTapped(_ sender: Any) {
        let network = NetworkingParser()
        network.fetchComments()
    }
    
}

