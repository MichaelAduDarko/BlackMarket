//
//  MessageContoller.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//

import UIKit

class MessageContoller: UIViewController {
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        
    }
    
    
    func configureUI(){
        view.backgroundColor = .black
        configureNavigationBar(withTitle: "Message", prefersLargeTitles: true)
    }
}
