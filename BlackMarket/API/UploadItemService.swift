//
//  UploadItemService.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 3/17/21.
//

import UIKit
import Firebase


class UploadItemService {
    
    static let shared = UploadItemService()
    
    func uploadItem(title: String, price: String, description: String, completion: @escaping(Error?) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        let values = ["uid":uid,
                      "title": title,
                      "price": price,
                      "description": description ] as [String : Any]
        
        REF_POSTITEM.addDocument(data: values, completion: completion)
        
    }
    
}

