//
//  CategoryCell.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//

import UIKit

struct categoryData {
    let image: UIImage
    let name : String?
}

class CategoryCell: UICollectionViewCell {
    
    //MARK:- Properties
    
    let categoryIV : UIImageView = {
        let iv = UIImageView()
        iv.translatesAutoresizingMaskIntoConstraints = false
        return iv
        
    }()
    
    let categoryIVLabel : UILabel = {
        let label = UILabel()
        label.text = "Name"
        label.textColor = UIColor.white
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 21)
        label.textAlignment = .center
        
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
        self.layer.shadowOpacity = 10
        self.layer.shadowRadius = 2
        self.layer.masksToBounds = false
        self.clipsToBounds = false
        self.layer.cornerRadius = 15
        backgroundColor = .systemPink
    }
    
    func setUp(){
        let imageHeight: CGFloat = contentView.bounds.size.height - 25
        let imageWidth: CGFloat = contentView.bounds.size.width
        
        contentView.addSubview(categoryIVLabel)
        categoryIVLabel.anchor(left: leftAnchor, bottom: bottomAnchor, right: rightAnchor, height: 25)
        
        contentView.addSubview(categoryIV)
        categoryIV.anchor(top:topAnchor, bottom: categoryIVLabel.topAnchor, width: imageWidth, height: imageHeight)
    }
    
    
    var data: categoryData? {
        didSet {
            guard  let data = data else {return}
            categoryIV.image = data.image
            categoryIVLabel.text = data.name
        }
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
