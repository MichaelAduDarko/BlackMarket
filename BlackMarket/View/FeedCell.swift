//
//  File.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//

import UIKit

struct feedData {
    let image: UIImage
    let productName : String?
    let locationName: String?
}

class FeedCell: UICollectionViewCell {
    
    //MARK:- Properties
    
    let feedImageView : UIImageView = {
        let iv = UIImageView()
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
        label.numberOfLines = 2
        
        return label
    }()
    
    let locationLabel: CustomLabel = {
        let label = CustomLabel( name: Font.AvenirNext , fontSize: 14, color: #colorLiteral(red: 0.6000000238, green: 0.6000000238, blue: 0.6000000238, alpha: 1))
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
        let imageHeight: CGFloat = contentView.bounds.size.height
        let imageWidth: CGFloat = contentView.bounds.size.width
        
        let stackView = UIStackView(arrangedSubviews: [feedLabel,locationLabel])
        stackView.axis = .vertical
        stackView.distribution = .fillEqually
        
        
        
        contentView.addSubview(stackView)
        stackView.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 45)
        
        contentView.addSubview(feedImageView)
        feedImageView.anchor(top:topAnchor, bottom: stackView.topAnchor, paddingBottom: 5,width: imageWidth, height: imageHeight)
    }
    
    
    var data: feedData? {
        didSet {
            guard  let data = data else {return}
            feedImageView.image = data.image
            feedLabel.text = data.productName
            locationLabel.text = data.locationName
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

