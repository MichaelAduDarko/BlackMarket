//
//  ImageContianerCell.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 3/11/21.
//

import UIKit


//MARK:-  Move into its own class
class ImageContainerViewCell: UICollectionViewCell {
    static let reuseIdentifier = "imageContainerViewCellIdentifier"
    
    private lazy var imageView: UIImageView = {
        let _imageView = UIImageView()
        _imageView.contentMode = .scaleAspectFill
        _imageView.translatesAutoresizingMaskIntoConstraints = false
        return _imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: .zero)
        
        configure()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setData(_ data: UIImage) {
        imageView.image = data
    }
}

extension ImageContainerViewCell {
    private func configure() {
        contentView.addSubview(imageView)
        NSLayoutConstraint.activate([
            imageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            imageView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            imageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor)
        ])
    }
}
