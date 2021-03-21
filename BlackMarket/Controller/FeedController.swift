//
//  FeedController.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//

import UIKit
import Firebase

class FeedController: UIViewController {

//    lazy var _data: [feedData] = dummyData._data
    
    private var posts = [Item]()

    //MARK:- Propeties
    fileprivate let collectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.translatesAutoresizingMaskIntoConstraints = false
        cv.showsVerticalScrollIndicator = false
        cv.backgroundColor = .backgroundColor
        cv.register(FeedCell.self, forCellWithReuseIdentifier: "cell")
        return cv
    }()



    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        populateUserData()
    }

    //MARK:- API
    
    func populateUserData(){
        UploadItemService.fetchPost { posts in
            self.posts = posts
            self.collectionView.reloadData()
            
            print("DEBUG: JKKLL\(posts)")
        }
        
    }

    //MARK:- Helper
    func configureUI(){
        view.backgroundColor = .backgroundColor
        configureNavigationBar(withTitle: "Market", prefersLargeTitles: true)

        view.addSubview(collectionView)
        collectionView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0).isActive = true

        collectionView.delegate = self
        collectionView.dataSource = self

        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: "cell")

    }


}



extension FeedController: UICollectionViewDelegateFlowLayout, UICollectionViewDataSource{

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width / 2) - 20
        return CGSize(width: width, height: width)

    }

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return posts.count
    }


    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! FeedCell
        let item = posts[indexPath.row]
        cell.update(with: item)
        return cell
    }
    
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let categoryDetail = DetailController()
        categoryDetail.modalPresentationStyle = .fullScreen
        present(categoryDetail, animated: true, completion: nil)
    }
    
    
}
