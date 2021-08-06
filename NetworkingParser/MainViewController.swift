//
//  ViewController.swift
//  NetworkingParser
//
//  Created by Nazario Mariano on 8/4/21.
//

import UIKit

class MainViewController: UIViewController {
    
    let activityIndicator = UIActivityIndicatorView(style: .large)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupActivityIndicator()
        activityIndicator.startAnimating()
        
        let network = Networking()

        network.fetch(resource: "todos", model: Todo.self) { results in
            print("results: \(results)")
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

extension UIViewController: UITableViewDataSource {
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
            cell.textLabel?.text = "Row \(indexPath.row)"
        
        return cell
    }
}

extension UIViewController: UITableViewDelegate {
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let navController = self.navigationController else {
            return
        }
        let detailViewController = DetailViewController(nibName: "DetailView", bundle: nil)
        navController.pushViewController(detailViewController, animated: true)
    }
}
