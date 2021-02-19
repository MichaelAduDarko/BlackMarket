//
//  DescriptionTextView.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/18/21.
//

import UIKit

class DescriptionTextView: UITextView {
    
    //MARK: Properties
    
    let placeholderLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .white
        label.text = "Description"
        return label
    }()
    
    //MARK:-Lifecycle
    
    override init(frame: CGRect, textContainer: NSTextContainer?) {
        super.init(frame: frame, textContainer: textContainer)
        
        backgroundColor = UIColor(white: 1, alpha: 0.2)
        font = UIFont.systemFont(ofSize: 16)
        isScrollEnabled = false
        textColor = .white
        layer.cornerRadius = 15.0
        layer.shadowRadius = 15
        layer.borderWidth = 3
        layer.masksToBounds = true
        layer.borderColor = #colorLiteral(red: 0.2213829578, green: 0.6727860964, blue: 0.9729384217, alpha: 1)
        heightAnchor.constraint(equalToConstant: 140).isActive = true
        
        addSubview(placeholderLabel)
        placeholderLabel.anchor(top: topAnchor, left: leftAnchor,
                                paddingTop: 8, paddingLeft: 8)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange),
                                               name: UITextView.textDidChangeNotification, object: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Selectors
    @objc func  handleTextInputChange(){
        placeholderLabel.isHidden = !text.isEmpty
    }
}
