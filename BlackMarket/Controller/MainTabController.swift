//
//  MainTabController.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//
import UIKit

class MainTabController: UITabBarController {
    
    //MARK:- Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK:- ConfigureUI
    
    private func configureUI(){
        
        let home = FeedController()
        let nav1 = templateNavigationController(image: UIImage(systemName: "house.fill"), rootviewController: home)
        nav1.title = "Feed"
    

        let category = CategoryController()
        let nav2 = templateNavigationController(image: UIImage(systemName: "archivebox.fill"), rootviewController: category)
        nav2.title = "Categories"
      

        let post = PostController()
        let nav3 = templateNavigationController(image: UIImage(systemName: "camera.on.rectangle.fill"), rootviewController: post)
        nav3.title = "Post"

        let message = MessageContoller()
        let nav4 = templateNavigationController(image: UIImage(systemName: "bubble.right.fill"), rootviewController: message)
        nav4.tabBarItem.badgeValue = "10"
        nav4.title = "Message"

        let profile = ProfileController()
        let nav5 = templateNavigationController(image: UIImage(systemName: "person.fill"), rootviewController: profile)
        nav5.title = "Profile"

        
        viewControllers = [nav1, nav2, nav3, nav4, nav5]
        
        guard  let items = tabBar.items else { return}
        
        for item in items {
            item.imageInsets = UIEdgeInsets(top: 10, left: 0, bottom: -10, right: 0)
        }
        
      
        
    }
    
    func templateNavigationController(image: UIImage?, rootviewController: UIViewController) -> UINavigationController {
        
        let nav = UINavigationController(rootViewController: rootviewController)
        nav.tabBarItem.image = image
        nav.title = title
        return nav
    }
    
}
