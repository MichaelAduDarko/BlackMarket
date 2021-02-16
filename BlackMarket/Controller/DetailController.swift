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
    }
}
