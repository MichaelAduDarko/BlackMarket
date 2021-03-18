//
//  File.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//

import UIKit
import Firebase

protocol ProfileControllerDelegate: class {
    func handleLogout()
}

class ProfileController: UITableViewController {
    
    private var user: User? {
        didSet { headerView.user = user }
    }
    
    
    weak var delegate: ProfileControllerDelegate?
    //MARK:- Properties
    
  private lazy var headerView = ProfileHeader(frame: .init(x: 0, y: 0, width: view.frame.width, height: 380))
    
    private let footerView = ProfileFooter()
    
    //MARK:- Lifecycle
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        fetchUser()

    }
        
    
    
    //MARK:- API
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        UserService.fetchUser { user in

            self.user = user
            print("DEBUG: Username is \(user.profileImageUrl )")
            print("DEBUG: Username is \(user.fullname )")
        }
    }
    
    
    
    //MARK:- Helpers
    
     func configureUI(){
        tableView.backgroundColor = .backgroundColor
        navigationController?.navigationBar.isHidden = true
        navigationController?.navigationBar.barStyle = .black
        
        tableView.tableHeaderView = headerView
        tableView.contentInsetAdjustmentBehavior = .never
        tableView.register(ProfileCell.self, forCellReuseIdentifier: Cell.CellID)
        tableView.rowHeight = 64
        tableView.backgroundColor = .backgroundColor
        
        footerView.delegate = self
        footerView.frame = .init(x: 0, y: 0, width: view.frame.width, height: 100)
        tableView.tableFooterView = footerView
    }
}


extension ProfileController {
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ProfileViewModel.allCases.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.CellID, for: indexPath) as! ProfileCell
        
        
        let viewModel = ProfileViewModel(rawValue: indexPath.row)
        cell.viewModel = viewModel
        cell.accessoryType = .disclosureIndicator
        
        return cell
        
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        guard let viewModel = ProfileViewModel(rawValue: indexPath.row) else { return }
        
        switch viewModel {
        case .accountInfo:
            let accountInfoVC = AccountInfoController()
            navigationController?.pushViewController(accountInfoVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
           
        case .listings:
            let listingsVC = ListingsController()
            navigationController?.pushViewController(listingsVC, animated: true)
            tableView.deselectRow(at: indexPath, animated: true)
       
        }
    }
}


extension ProfileController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}


extension ProfileController: ProfileFooterDelegate{
    
    func handleLogout(){
        
        let alert = UIAlertController(title: nil, message: "Are you sure you want to logout? ", preferredStyle: .actionSheet)
        
        alert.addAction(UIAlertAction(title: "Log out", style: .destructive, handler: { _ in
            self.dismiss(animated: true, completion: nil)
            self.delegate?.handleLogout()
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
        present(alert, animated: true, completion: nil)
    }
}
