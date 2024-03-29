//
//  ProfileHeader.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/2/21.
//

import UIKit
import SDWebImage

class ProfileHeader: UIView {
    
    var user : User? {
        didSet { populateUserData()}
    }
    //MARK:- Properties
    private let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.clipsToBounds = true
//        iv.image = #imageLiteral(resourceName: "IMG_0330")
        iv.contentMode = .scaleAspectFill
        iv.layer.borderColor = UIColor.white.cgColor
        iv.layer.borderWidth = 4.0
        return iv
    }()
    

    private let fullnameLabel : CustomLabel = {
        let label = CustomLabel(name: Font.Futura, fontSize: 20, color: .white)
        label.textAlignment = .center
        return label
    }()
    
    
    private let usernameLabel : CustomLabel = {
        let label = CustomLabel(name: Font.Futura, fontSize: 16, color: .white)
        label.textAlignment = .center
        return label
    }()
    
    //MARK:- LifeCycle
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        ConfigureUI()
        backgroundColor = .backgroundColor
        populateUserData()
        
    }
    
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func ConfigureUI(){
        profileImageView.setDimensions(height: 200, width: 200)
        profileImageView.layer.cornerRadius = 200 / 2
        
        
        addSubview(profileImageView)
        profileImageView.centerX(inView: self)
        profileImageView.anchor(top: topAnchor, paddingTop: 96)
        
        let stack = UIStackView(arrangedSubviews: [fullnameLabel, usernameLabel])
        stack.axis = .vertical
        stack.spacing = 4
        
        addSubview(stack)
        stack.centerX(inView: self)
        stack.anchor(top: profileImageView.bottomAnchor, paddingTop: 16)
    }
    
    //MARK:- API
    
    func populateUserData(){
        guard let user  = user else { return }
        fullnameLabel.text = user.fullname
        
        guard let url = URL(string: user.profileImageUrl) else { return }
        profileImageView.sd_setImage(with: url)

    }
    
    //MARK:- Helpers
    
    func configureGradientLayer(){
        let gradient = CAGradientLayer()
        gradient.colors = [UIColor.systemPurple.cgColor, UIColor.systemPink.cgColor]
        gradient.locations = [0,1]
        layer.addSublayer(gradient)
        gradient.frame = bounds
    }
}
