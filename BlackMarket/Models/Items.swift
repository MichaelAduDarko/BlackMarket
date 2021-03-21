//
//  Items.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 3/20/21.
//

import Firebase

struct Item {
    let uid: String
    let postItemID: String
    let title: String
    let price: String
    let description: String
    
    init(postItemID: String, dictionary: [String: Any]) {
        
        self.postItemID = postItemID
        self.uid = dictionary ["uid"] as? String ?? ""
        self.title = dictionary ["title"] as? String ?? ""
        self.price = dictionary ["price"] as? String ?? ""
        self.description = dictionary ["description"] as? String ?? ""
        
        
    }
}
