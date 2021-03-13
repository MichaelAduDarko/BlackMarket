//
//  ImageContainer.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 3/11/21.
//

import UIKit

//MARK: -  ImageContainerDelegate
protocol ImageContainerDelegate: class {
    func didTapContainer()
}
 
// MARK: - ImageContainerViewController
class ImageContainerViewController: UIViewController {
    private var dataSource = [UIImage]()
    
    weak var delegate: ImageContainerDelegate?
    
    private lazy var tapGesture = self.makeGestureRecognizer()
    
    private lazy var collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .horizontal
        let collection = UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.backgroundColor = .red
        collection.dataSource = self
        collection.delegate = self
        collection.addGestureRecognizer(tapGesture)
        collection.register(ImageContainerViewCell.self, forCellWithReuseIdentifier: ImageContainerViewCell.reuseIdentifier)
        
        return collection
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configure()
    }
    
    public func update(with data: [UIImage]) {
        guard !data.isEmpty else { return }
        
        collectionView.removeGestureRecognizer(tapGesture)
        
        dataSource = data
        collectionView.reloadData()
    }
}

extension ImageContainerViewController {
    private func configure() {
        view.backgroundColor = .white
        
        view.addSubview(collectionView)
        NSLayoutConstraint.activate([
            collectionView.topAnchor.constraint(equalTo: view.topAnchor),
            collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
    
    @objc private func didTapContainer() {
        delegate?.didTapContainer()
    }
    
    private func makeGestureRecognizer() -> UITapGestureRecognizer {
        let tap = UITapGestureRecognizer(target: self, action: #selector(didTapContainer))
        tap.cancelsTouchesInView = true 
        return tap
    }
}

extension ImageContainerViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: ImageContainerViewCell.reuseIdentifier, for: indexPath) as! ImageContainerViewCell
        
        let data = dataSource[indexPath.row]
        cell.setData(data)
        
        return cell
    }
}

extension ImageContainerViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: collectionView.frame.height)
    }
}
