//
//  AccountInfoController.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/10/21.
//

import UIKit

class AccountInfoController: UIViewController {
    
    //MARK:- Properties
    private let backButton: UIButton = {
        let button = UIButton(type: .system)
        button.addTarget(self, action: #selector(handleDismissal), for: .touchUpInside)
        button.setImage(UIImage(systemName: ImageSystemName.ChevronLeft), for: .normal)
        button.imageView?.setDimensions(height: 30, width: 26)
        button.tintColor = .white
        return button
    }()
    
   private let titlelabel = CustomLabel( name: Font.Futura, fontSize: 30, color: .white)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        
    }
    
    
    //MARK:- Selectors
    @objc func handleDismissal() {
        navigationController?.popViewController(animated: true)
    }
    
    
    func configureUI(){
        view.backgroundColor = .backgroundColor
        
        let stackView = UIStackView(arrangedSubviews: [backButton, titlelabel])
        stackView.axis = .horizontal
        stackView.spacing = 20
        stackView.distribution = .fillProportionally
        
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor, left: view.leftAnchor, paddingTop: 10, paddingLeft: 10)
        

    }
}
