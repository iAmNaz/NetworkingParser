//
//  ViewController.swift
//  NetworkingParser
//
//  Created by Nazario Mariano on 8/4/21.
//

import UIKit

class ViewController: UIViewController {
    let activityIndicator = UIActivityIndicatorView(style: .large)
    @IBOutlet weak var resultTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        resultTextView.isHidden = true
        activityIndicator.startAnimating()
        
        
        let network = Networking()
        network.fetch(resource: "todos", model: Todo.self) { results in
            let todos:[Todo] = results as! [Todo]
            self.resultTextView.isHidden = false
            self.resultTextView.text = todos.first!.title
            self.activityIndicator.stopAnimating()
        }
    }
    fileprivate func setupActivityIndicator() {

        activityIndicator.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.hidesWhenStopped = true
        self.view.addSubview(activityIndicator)

        let centerXconstraint = activityIndicator.centerXAnchor.constraint(equalTo: self.view.centerXAnchor, constant: 0)
        let centerYconstraint = activityIndicator.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: 0)

        let constraints = [centerYconstraint, centerXconstraint]

        NSLayoutConstraint.activate(constraints)
    }
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        let network = Networking()
        network.fetch(resource: "todos", model: Todo.self) { results in
            print(results)
        }
    }
}

