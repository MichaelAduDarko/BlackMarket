//
//  HeaderViewModel.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 3/18/21.
//

import Foundation

struct HeaderViewModel {
    let user: User
    
    var fullname: String{
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImageUrl)
    }
    
    init(user: User) {
        self.user = user
    }
}
