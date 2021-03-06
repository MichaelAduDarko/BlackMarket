//
//  PostCustomButton.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/15/21.
//

import UIKit

class PostCustomButton: UIButton {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    init(){
        super.init(frame: .zero)
        tintColor = .white
        setDimensions(height: 50, width: 50)
        imageView?.setDimensions(height: 30, width: 30)
        layer.cornerRadius = 50 / 2
        backgroundColor = #colorLiteral(red: 0.4723458886, green: 0.4695421457, blue: 0.4745038152, alpha: 1)
        setImage(UIImage(systemName: "camera.on.rectangle.fill"), for: .normal)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
