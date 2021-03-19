//
//  User.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 3/18/21.
//

import Foundation

struct User {
    let email: String
    let fullname: String
    let profileImageUrl: URL?
    let uid: String
    
    
    init(dictionary: [String:Any]) {
        
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.profileImageUrl = dictionary["profileImageUrl"] as? URL
        self.uid = dictionary["uid"] as? String ?? ""
        
        print(dictionary)
        
    }
}
