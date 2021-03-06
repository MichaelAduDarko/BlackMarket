//
//  CustomInputAccessoryView.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 3/9/21.
//

import UIKit

class CustomInputAccessoryView: UIView {
    
    //MARK:- Properties
    
    private lazy var messageInputTextView : UITextView = {
        let tv = UITextView()
        tv.font = UIFont.systemFont(ofSize: 16)
        tv.layer.cornerRadius = 12
        tv.textColor = .white
        tv.text = "Hi, is this item still available ?"
        tv.backgroundColor = UIColor(white: 1, alpha: 0.2)
        tv.isScrollEnabled = false
        return tv
    }()
    
    private lazy var sendButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Send", for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 18)
        button.setTitleColor(#colorLiteral(red: 1, green: 1, blue: 1, alpha: 1), for: .normal)
        button.addTarget(self, action: #selector(handleSendMsssage), for: .touchUpInside)
        return button
    }()
    
    private let placeHolderLabel: UILabel = {
        let label = UILabel()
//        label.text = "Enter Message"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = .lightGray
        return label
    }()
    //MARK: - LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = #colorLiteral(red: 0.1276400089, green: 0.127668947, blue: 0.127636224, alpha: 1)
        autoresizingMask = .flexibleHeight
        
        self.layer.cornerRadius = 16
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        addSubview(sendButton)
        sendButton.anchor(top: topAnchor, right: rightAnchor, paddingTop: 4, paddingRight: 8)
        sendButton.setDimensions(height: 50, width: 50)
        
        messageInputTextView.addDoneButton(title: "Done", target: self, selector: #selector(tapDone))
        addSubview(messageInputTextView)
        messageInputTextView.anchor(top: topAnchor, left: leftAnchor,
                                    bottom: safeAreaLayoutGuide.bottomAnchor,
                                    right: sendButton.leftAnchor, paddingTop: 12,
                                    paddingLeft:8, paddingBottom: 8, paddingRight: 8)
        
        addSubview(placeHolderLabel)
        placeHolderLabel.anchor(left: messageInputTextView.leftAnchor, paddingLeft: 4)
        placeHolderLabel.centerY(inView: messageInputTextView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(handleTextInputChange),
                                               name: UITextView.textDidChangeNotification, object: nil)
    }
    
    
    
    override var intrinsicContentSize: CGSize {
        return .zero
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK:- Selectors
    
    @objc func handleTextInputChange(){
        placeHolderLabel.isHidden = !self.messageInputTextView.text.isEmpty
    }
    
    @objc func handleSendMsssage(){
       print("Text message sent")
    }
    
    //MARK:- Helpers
    
    func clearMessageText(){
        messageInputTextView.text = nil
        placeHolderLabel.isHidden = false
    }
}

extension CustomInputAccessoryView {
    @objc func tapDone(sender: Any) {
        messageInputTextView.endEditing(true)
    }
}
