//
//  CustomSystemButton.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/15/21.
//

import UIKit


class CancelSystemButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(){
        super.init(frame: .zero)
       tintColor = .white
       setDimensions(height: 40, width: 40)
       imageView?.setDimensions(height: 26, width: 26)
       layer.cornerRadius = 40 / 2
       backgroundColor = .systemRed
       setImage(UIImage(systemName: "xmark"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
