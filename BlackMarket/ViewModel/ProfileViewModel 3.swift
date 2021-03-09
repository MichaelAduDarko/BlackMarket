//
//  ProfileViewModel.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/3/21.
//

import Foundation

enum ProfileViewModel: Int, CaseIterable {
    case accountInfo
    case listings
    
    var description: String {
        switch self {
        case .accountInfo : return "Account Info"
        case .listings : return "Your Listings"
        }
    }
    
    var iconImageName: String {
        switch self {
        case .accountInfo : return "person.circle"
        case .listings : return "tag.fill"
        }
    }
    
}
