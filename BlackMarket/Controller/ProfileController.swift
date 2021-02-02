//
//  File.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//

import UIKit


class ProfileController: UIViewController {
    
    //MARK:- Properties
    
    private let titlelabel = CustomLabel(title: Constant.ProfileLabel, name: Font.Futura, fontSize: 30, color: .white)
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    private func configureUI(){
        view.backgroundColor = .backgroundColor
        navigationController?.navigationBar.isHidden = true
    
        
        view.addSubview(titlelabel)
        titlelabel.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                          left: view.leftAnchor,
                          paddingTop: 20, paddingLeft: 30)
        
    }
}
