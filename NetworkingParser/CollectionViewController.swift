//
//  CollectionViewController.swift
//  NetworkingParser
//
//  Created by Nazario Mariano on 8/9/21.
//

import UIKit

class CollectionViewController: UIViewController {
    private let cellIdentifier = "AlbumCell"
    private let activityIndicator = UIActivityIndicatorView(style: .large)
    private var albums: [Album] = []
    private var collectionView: UICollectionView!
    private let network = Networking()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let collectionViewLayout = UICollectionViewFlowLayout()
        collectionViewLayout.scrollDirection = .vertical
        collectionViewLayout.itemSize = CGSize(width: 100, height: 100)
        collectionViewLayout.minimumInteritemSpacing = 2
        collectionViewLayout.minimumLineSpacing = 30

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: collectionViewLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .orange
        
        let cellNib = UINib(nibName: "AlbumCollectionViewCell", bundle: nil)
        collectionView.register(cellNib, forCellWithReuseIdentifier: cellIdentifier)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(collectionView)
        
        let constraints = [
                collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
                collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0),
                collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
                collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0)
            ]
        
        NSLayoutConstraint.activate(constraints)
        
        network.fetch(resource: "albums", model: Album.self) { results in
            self.albums = results as! [Album]
            self.activityIndicator.stopAnimating()
            self.collectionView.reloadData()
        }
    }
}

extension CollectionViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return albums.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellIdentifier, for: indexPath) as! AlbumCollectionViewCell

        return cell
    }
}

extension CollectionViewController: UICollectionViewDelegate {
    
}
