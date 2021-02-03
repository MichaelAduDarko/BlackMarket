//
//  File.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//

import UIKit


class ProfileController: UITableViewController {
    
    //MARK:- Properties
    
  private lazy var headerView = ProfileHeader(frame: .init(x: 0, y: 0, width: view.frame.width, height: 380))
    
    private let footerView = ProfileFooter()
    
    //MARK:- Lifecycle
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    
    //MARK:- API
    
    
    
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
}


extension ProfileController {
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return UIView()
    }
}
