//
//  UploadItemService.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 3/17/21.
//

import UIKit
import Firebase


struct UploadItemService {
    
    static let shared = UploadItemService()
    
    static func uploadItem(image: UIImage,title: String, price: String, description: String, completion: @escaping(Error?) -> Void){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        ImageUploader.uploadImage(image: image) { imageUrl in
            
            let values = ["imageUrl": imageUrl,
                          "uid":uid,
                          "title": title,
                          "price": price,
                          "description": description ] as [String : Any]
            
            REF_POSTITEM.addDocument(data: values, completion: completion)
        }
    }
    
    static func fetchPost(completion: @escaping([Items]) -> Void){
        REF_POSTITEM.getDocuments { (snapshot, error) in
            
            guard let documents = snapshot?.documents else { return }
            
            let posts = documents.map({Items(postItemID: $0.documentID, dictionary: $0.data())})
            completion(posts)
            
            
        }
        
    }
    
}

