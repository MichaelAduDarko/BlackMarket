//
//  DetailController.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/10/21.
//

import UIKit
import Firebase

class DetailController: UIViewController{
    
    
    //MARK:- Propeties
    var posts : Item? {
        didSet { populateUserData()}
    }
    
//    private var posts = [Items]()
    
    let stackScrollView = StackScrollView()
    
    private let cancelButton: CancelSystemButton = {
        let button = CancelSystemButton()
        button.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        return button
    }()
    
    private let imageBg: UIImageView = {
        let view = UIImageView()
        view.contentMode = .scaleToFill
        view.image = #imageLiteral(resourceName: "IMG_0330")
        view.heightAnchor.constraint(equalToConstant: 300).isActive = true
        return view
    }()
    
    private let itemtitle = CustomLabel( name: Font.Futura, fontSize: 30 , color: .white)
    
    private let priceTitle : CustomLabel = {
        let label =  CustomLabel( name: Font.Futura, fontSize: 25 , color: .systemPink)
        label.text = "Price"
        return label
    }()
    
    private let priceTag = CustomLabel( name: Font.AvenirNext, fontSize: 20 , color: .white)
    
    private let userLocation : CustomLabel = {
        let label = CustomLabel( name: Font.AvenirNext, fontSize: 15 , color: .gray)
        label.text = "Newark"
       return label
    }()
    

    private let descriptionTitle : CustomLabel = {
        let label =  CustomLabel( name: Font.Futura, fontSize: 25 , color: .systemPink)
        label.text = "Description"
        return label
    }()
    
    private let itemDescription = CustomLabel( name: Font.AvenirNext, fontSize: 20 , color: .white)
    
    private lazy var messageView: CustomInputAccessoryView = {
        let tv = CustomInputAccessoryView()
        return tv
    }()
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configure()
        populateUserData()

    }
    
    //MARK:- API
    func populateUserData(){
        guard let post = posts else { return }
        itemtitle.text = post.title
        priceTag.text = post.price
        itemDescription.text = post.description
        imageBg.sd_setImage(with: URL(string: post.imageUrl))
    }
    
    //MARK:- Selectors
    @objc func handleCancelButton (){
        dismiss(animated: true, completion: nil)
        
    }
    
    
    @objc func keyboardwillhide(){
        stackScrollView.contentInset = .zero
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            stackScrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
        }
    
    
    //MARK:- Helper
    
    private func configure(){
        view.backgroundColor = .backgroundColor
        
        view.addSubview(cancelButton)
        cancelButton.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                            left: view.leftAnchor, paddingLeft: 10)
        
        stackScrollView.backgroundColor = .backgroundColor
        view.addSubview(stackScrollView)
        NSLayoutConstraint.activate([
            stackScrollView.topAnchor.constraint(equalTo: cancelButton.bottomAnchor,constant: 5),
            stackScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        
        
        
        let stackView = UIStackView(arrangedSubviews: [imageBg,itemtitle, priceTitle, priceTag,userLocation ,messageView, descriptionTitle, itemDescription])
        stackView.spacing = 10
        stackView.axis = .vertical
        
        stackScrollView.insertView(stackView)
        
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillhide), name: UIResponder.keyboardWillHideNotification, object: nil)
    
    }
}
