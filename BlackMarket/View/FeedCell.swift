//
//  File.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//

import UIKit

struct feedData {
    let image: UIImage
    let name : String?
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
        let imageHeight: CGFloat = contentView.bounds.size.height - 25
        let imageWidth: CGFloat = contentView.bounds.size.width
        
        contentView.addSubview(feedLabel)
        feedLabel.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 25)
        
        contentView.addSubview(feedImageView)
        feedImageView.anchor(top:topAnchor, bottom: feedLabel.topAnchor, width: imageWidth, height: imageHeight)
    }
    
    
    var data: feedData? {
        didSet {
            guard  let data = data else {return}
            feedImageView.image = data.image
            feedLabel.text = data.name
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

