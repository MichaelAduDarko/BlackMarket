//
//  DetailController.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/10/21.
//

import UIKit

class DetailController: UIViewController {
    
    
    //MARK:- Propeties
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
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
    }
    
    
    //MARK:- Selectors
    @objc func handleCancelButton (){
        dismiss(animated: true, completion: nil)
        
    }
    
    
    //MARK:- Helper
    
    func configure(){
        view.backgroundColor = .backgroundColor
        
        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                            left: view.leftAnchor, paddingLeft: 10)
        
        
        let stackView = UIStackView(arrangedSubviews: [imageBg,itemtitle, priceTitle, priceTag, descriptionTitle, itemDescription])
        stackView.spacing = 10
        stackView.axis = .vertical
        
        view.addSubview(stackView)
        stackView.anchor(top: cancelButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10, paddingLeft: 5, paddingRight: 5)
        
        
        
        
        
        
    }
}
