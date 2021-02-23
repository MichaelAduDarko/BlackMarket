//
//  MainTabController.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//
import UIKit
import Firebase

class MainTabController: UITabBarController, UINavigationControllerDelegate {
    
    //MARK:- Properties
    
    private let postItemButton: PostCustomButton = {
        let button = PostCustomButton()
        button.addTarget(self, action: #selector(handlepostItemButton), for: .touchUpInside)
        return button
    }()
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        authenticateUser()
    }
    
    
    //MARK:- API
    func authenticateUser(){
        if Auth.auth().currentUser?.uid == nil {
            presentLoginScreen()
            print("DEBUG: Preseny current screen ")
        } else {
            
            print("DEBUG: User is id is\(Auth.auth().currentUser?.uid) ")
        }
       
    }
    
    func logout(){
        do{
            try Auth.auth().signOut()
            presentLoginScreen()
        }  catch {
            print("DEBUG: error sigining out ")
        }
    }
    
    func presentLoginScreen(){
        DispatchQueue.main.async {
            
            let controller = LoginController()
            let nav = UINavigationController(rootViewController: controller)
            nav.modalPresentationStyle = .fullScreen
            self.present(nav, animated: true, completion: nil)
            
            
        }
    }
    
    //MARK:- Selector
    
    @objc func handlepostItemButton(){
        let postItem = PostController()
        postItem.modalPresentationStyle = .formSheet
        present(postItem, animated: true, completion: nil)
    }
    
    //MARK:- ConfigureUI
    
    private func configureUI(){
        
        let home = FeedController()
        let nav1 = templateNavigationController(image: UIImage(systemName: "house.fill"), rootviewController: home)
        nav1.title = "Feed"
    

        let category = CategoryController()
        let nav2 = templateNavigationController(image: UIImage(systemName: "archivebox.fill"), rootviewController: category)
        nav2.title = "Categories"
 

        let message = MessageContoller()
        let nav4 = templateNavigationController(image: UIImage(systemName: "bubble.right.fill"), rootviewController: message)
        nav4.tabBarItem.badgeValue = "10"
        nav4.title = "Message"

        let profile = ProfileController(style: .insetGrouped)
        profile.delegate = self
        let nav5 = templateNavigationController(image: UIImage(systemName: "person.fill"), rootviewController: profile)
        nav5.title = "Profile"

        
        viewControllers = [nav1, nav2, nav4, nav5]
        
        guard  let items = tabBar.items else { return}
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        }
        
        
        view.addSubview(postItemButton)
        postItemButton.anchor( bottom: view.safeAreaLayoutGuide.bottomAnchor,right: view.rightAnchor,
                               paddingBottom: 64, paddingRight: 16)
        
    }
    
    func templateNavigationController(image: UIImage?, rootviewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootviewController)
        nav.tabBarItem.image = image
        nav.title = title
        return nav
    }
    
}


extension MainTabController: ProfileControllerDelegate {
    func handleLogout() {
        logout()
    }
}
