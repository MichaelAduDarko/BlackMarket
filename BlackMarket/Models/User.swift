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
    let profileImageUrl: String
    let uid: String
    
    
    init(dictionary: [String:Any]) {
        
        self.email = dictionary[Keys.email] as? String ?? ""
        self.fullname = dictionary[Keys.fullName] as? String ?? ""
        self.profileImageUrl = dictionary[Keys.profileImageURL] as? String ?? ""
        self.uid = dictionary[Keys.identifier] as? String ?? ""
        
    }
}

extension User {
    enum Keys {
        static let email = "email"
        static let fullName = "fullname"
        static let profileImageURL = "profileIamgeUrl"
        static let identifier = "uid"
    }
}
