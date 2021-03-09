//
//  DividerView.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//

import UIKit

class DividerView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        let label = UILabel()
        label.text = "OR"
        label.textColor = UIColor(white: 1, alpha: 0.87)
        label.font = UIFont.boldSystemFont(ofSize: 14)
        
        addSubview(label)
        label.checkIfAutoLayOut()
        label.centerX(inView: self)
        label.centerY(inView: self)
        
        
        let dividerOne = UIView()
        dividerOne.backgroundColor = UIColor(white: 1, alpha: 0.25)
        addSubview(dividerOne)
        dividerOne.centerY(inView: self)
        dividerOne.anchor(left: leftAnchor, right: label.leftAnchor,
                          paddingLeft: 8, paddingRight: 8, height: 1.0)
        
        
        let dividerTwo = UIView()
        dividerTwo.backgroundColor = UIColor(white: 1, alpha: 0.25)
        addSubview(dividerTwo)
        dividerTwo.centerY(inView: self)
        dividerTwo.anchor(left: label.rightAnchor, right: rightAnchor,
                          paddingLeft: 8, paddingRight: 8, height: 1.0)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
