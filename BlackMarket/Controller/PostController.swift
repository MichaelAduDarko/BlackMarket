//
//  PostController.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//


import UIKit


class PostController: UIViewController, UITextFieldDelegate {
     
    //MARK:- Properties
    
    let categoryPickerView: UIPickerView = UIPickerView()
    
    
    private let cancelButton: CancelSystemButton = {
        let button = CancelSystemButton()
        button.addTarget(self, action: #selector(handleCancelButton), for: .touchUpInside)
        return button
    }()
    
    
    private let doneButton: UIButton = {
        let button = UIButton()
        button.setDimensions(height: 40, width: 40)
        button.imageView?.setDimensions(height: 26, width: 26)
        button.layer.cornerRadius = 40 / 2
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        return button
    }()
    
    private let bg: UIView = {
        let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.8039215803, green: 0.8039215803, blue: 0.8039215803, alpha: 1)
        view.layer.cornerRadius = 10
        return view
    }()
    
    private let listItemTitle: ListItemTextField = {
        let tf = ListItemTextField(placeHolder: "Title")
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tf.widthAnchor.constraint(equalToConstant: 12).isActive = true
        return tf
    }()
    
    private let price: ListItemTextField = {
        let tf = ListItemTextField(placeHolder: "Price")
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tf.widthAnchor.constraint(equalToConstant: 12).isActive = true
        return tf
    }()
    
   
    
    private let descriptionTf: ListItemTextField = {
        let tf = ListItemTextField(placeHolder: " ")
        tf.heightAnchor.constraint(equalToConstant: 150).isActive = true
        tf.widthAnchor.constraint(equalToConstant: 12).isActive = true
        return tf
    }()
    
    
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        price.delegate = self
        descriptionTf.delegate = self
     
        
//        categoryPickerView.delegate = self
//        categoryPickerView.dataSource = self
//
        categoryPickerView.isHidden = true
    }
    
    
    
    //MARK:- Selectors
    @objc func handleCancelButton(){
        dismiss(animated: true, completion: nil)
    }
    
    @objc func handleCategoryButton(){
        
        if categoryPickerView.isHidden {
            categoryPickerView.isHidden = false
        }
    }
    
    //MARK:- Helpers
    
    private func configureUI(){
        view.backgroundColor = .backgroundColor
        navigationController?.navigationBar.isHidden = true
        
        let topStack = UIStackView(arrangedSubviews: [doneButton,  UIView(),cancelButton])
        topStack.axis = .horizontal
        topStack.distribution = .equalCentering
        topStack.isLayoutMarginsRelativeArrangement = true
        topStack.layoutMargins = .init(top: 0, left: 16, bottom: 0, right: 16)
        
        view.addSubview(topStack)
        topStack.anchor(top: view.safeAreaLayoutGuide.topAnchor,
                         left: view.leftAnchor,
                         right: view.rightAnchor, paddingTop: 10)
        
        
        view.addSubview(bg)
        bg.anchor(top: topStack.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10,
                  paddingLeft: 5, paddingRight: 5,height: 250)
        
        
        let stackView = UIStackView(arrangedSubviews: [listItemTitle, price, descriptionTf])
        stackView.axis = .vertical
        stackView.spacing = 15
        
        view.addSubview(stackView)
        stackView.anchor(top: bg.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10,
                            paddingLeft: 5, paddingRight: 5)
        
        
    }
}


