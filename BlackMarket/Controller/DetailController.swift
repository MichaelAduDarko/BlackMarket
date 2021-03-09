//
//  DetailController.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/10/21.
//

import UIKit

class DetailController: UIViewController {
    
    
    //MARK:- Propeties
    
    let stackScrollView = StackScrollView()
    
    private let cancelButton: CancelSystemButton = {
        let button = CancelSystemButton()
        button.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        return button
    }()
    
    private let imageBg: UIImageView = {
        let view = UIImageView()
        view.image = #imageLiteral(resourceName: "IMG_0330")
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return view
    }()
    
    private let itemtitle = CustomLabel(title: "Play Station 5", name: Font.Futura, fontSize: 30 , color: .white)
    
    private let priceTitle = CustomLabel(title: "Price", name: Font.Futura, fontSize: 25 , color: .systemPink)
    
    private let priceTag = CustomLabel(title: "$200", name: Font.AvenirNext, fontSize: 20 , color: .white)
    
    private let descriptionTitle = CustomLabel(title: "Description", name: Font.Futura, fontSize: 25 , color: .systemPink)
    
    private let itemDescription = CustomLabel(title: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.", name: Font.AvenirNext, fontSize: 20 , color: .white)
    
    private let messagetextView: DescriptionTextView = {
        let tv = DescriptionTextView()
        tv.autocorrectionType = .no
        tv.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        return tv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    //MARK:- Selectors
    @objc func handleCancelButton (){
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @objc func tapDone(sender: Any) {
            self.view.endEditing(true)
        }
    
    @objc func keyboardwillhide(){
        stackScrollView.contentInset = .zero
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            stackScrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
        }
    
    
    //MARK:- Helper
    
    private func configure(){
        view.backgroundColor = .backgroundColor
        
        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                            left: view.leftAnchor, paddingLeft: 10)
        
        stackScrollView.backgroundColor = .backgroundColor
        view.addSubview(stackScrollView)
        NSLayoutConstraint.activate([
            stackScrollView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor,constant: 5),
            stackScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        
        
        let stackView = UIStackView(arrangedSubviews: [imageBg,itemtitle, priceTitle, priceTag, descriptionTitle, itemDescription, messagetextView])
        stackView.spacing = 10
        stackView.axis = .vertical
        
        stackScrollView.insertView(stackView)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillhide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
        
        
    }
}
