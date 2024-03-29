//
//  File.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//

import UIKit
import SDWebImage

struct feedData {
    let image: UIImage
    let productName : String?
    let locationName: String?
}

class FeedCell: UICollectionViewCell {
    
    //MARK:- Properties
    
    let feedImageView : UIImageView = {
        let iv = UIImageView()
        iv.contentMode = .scaleToFill
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
        
    }()
    
    let feedLabel : UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font =  UIFont(name: Font.AvenirNext , size: 16)
        label.textAlignment = .left
        return label
    }()
    
    let locationLabel: CustomLabel = {
        let label = CustomLabel( name: Font.AvenirNext , fontSize: 11, color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
        label.textAlignment = .left
        return label
    }()
    
    
    //Mark: Init
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUp()
        setCellShadow()
    }
    
    
    
    //MARK:- Helpers
    func setCellShadow(){
        self.layer.shadowColor = UIColor.gray.cgColor
        self.layer.shadowOffset = CGSize(width: 1, height: 1)
        self.layer.masksToBounds = false
        backgroundColor = .clear
        
    }
    
    func setUp(){
        let stackView = UIStackView(arrangedSubviews: [feedLabel,locationLabel])
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .vertical
//        stackView.distribution = .fillEqually

        let height = contentView.bounds.size.height * 0.80
        contentView.addSubview(feedImageView)
        NSLayoutConstraint.activate([
            feedImageView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            feedImageView.topAnchor.constraint(equalTo: contentView.topAnchor),
            feedImageView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            feedImageView.heightAnchor.constraint(equalToConstant: height)
        ])

        contentView.addSubview(stackView)
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: feedImageView.bottomAnchor)
        ])
    }
    
    
    var data: feedData? {
        didSet {
            guard  let data = data else {return}
            feedImageView.image = data.image
            feedLabel.text = data.productName
            locationLabel.text = data.locationName
        }
    }

    func update(with item: Item) {
        feedLabel.text = "\(item.title) $\(item.price)"
        locationLabel.text = item.uid
        feedImageView.sd_setImage(with: URL(string: item.imageUrl))
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

