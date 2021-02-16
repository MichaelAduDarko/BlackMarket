//
//  PostController.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//

import UIKit

class PostController: UIViewController {
    
    //MARK:- Properties
    
    private let titlelabel = CustomLabel(title: Constant.PostLabel, name: Font.Futura, fontSize: 25, color: .white)
    
    private let cancelButton: CancelSystemButton = {
        let button = CancelSystemButton()
        button.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        return button
    }()
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    
    //MARK:- Selectors
    @objc func handleCancelButton(){
        dismiss(animated: true, completion: nil)
    }
    
    
    //MARK:- Helpers
    
    private func configureUI(){
        view.backgroundColor = .backgroundColor
        navigationController?.navigationBar.isHidden = true
        
        let stackView = UIStackView(arrangedSubviews: [titlelabel, UIView(),cancelButton])
        stackView.axis = .horizontal
        stackView.distribution = .equalCentering
        
        
        view.addSubview(stackView)
        stackView.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          right: view.rightAnchor,paddingTop: 10, paddingLeft: 5, paddingRight: 5)
        
    }
}
