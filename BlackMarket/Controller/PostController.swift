//
//  PostController.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//


import UIKit
import TTGTagCollectionView

class PostController: UIViewController, UITextFieldDelegate {
     
    //MARK:- Properties
    
    private let categoryTag: TTGTextTagCollectionView = {
        let tag = TTGTextTagCollectionView()
        tag.alignment = .left
    
        let config = TTGTextTagConfig()
        config.backgroundColor = .mainBlueTintColor
        config.textColor = .white
        config.borderColor = .systemPink
        config.borderWidth = 2
        tag.addTags(["Electronics", "Appliances", "Food", "Clothes", "Shoes", "Vehicles","Video Games", "Cosmetics", "Sports", "Book", "Furniture", "Others"], with: config)
        return tag
    }()
    
    
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
        tf.keyboardType = .numberPad
        tf.heightAnchor.constraint(equalToConstant: 50).isActive = true
        tf.widthAnchor.constraint(equalToConstant: 12).isActive = true
        return tf
    }()
    
    
    private let descriptionTV :  DescriptionTextView = {
        let tv = DescriptionTextView()
        tv.addDoneButton(title: "Done", target: self, selector: #selector(tapDone(sender:)))
        return tv
    }()
    
    override func  viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        tapOutsideToDimissKeyboard()
        listItemTitle.delegate = self
        price.delegate = self
        descriptionTV.delegate = self
        
        categoryTag.delegate = self
    }
    
    
    
    //MARK:- Selectors
    @objc func handleCancelButton(){
        dismiss(animated: true, completion: nil)
    }

    
    @objc func tapDone(sender: Any) {
            self.view.endEditing(true)
        }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    @objc func keyboardwillshow(){
        if view.frame.origin.y == 0 {
            self.view.frame.origin.y -= 280
        }
    }
    
    @objc func keyboardwillhide(){
        if view.frame.origin.y != 0 {
        view.frame.origin.y = 0
        }
    }
    //MARK:- Helpers
    
    private func configureUI(){
        view.addSubview(categoryTag)
        
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
        
        
        let stackView = UIStackView(arrangedSubviews: [listItemTitle, price, categoryTag,descriptionTV])
        stackView.axis = .vertical
        stackView.spacing = 15
        
        view.addSubview(stackView)
        stackView.anchor(top: bg.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 10,
                            paddingLeft: 5, paddingRight: 5)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillshow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardwillhide), name: UIResponder.keyboardWillHideNotification, object: nil)
        
        
    }
    
    func tapOutsideToDimissKeyboard(){
        let tapOutside: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(dismissKeyboard))
        tapOutside.cancelsTouchesInView = false
        view.addGestureRecognizer(tapOutside)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}


//MARK:- TextView Extension

extension PostController: UITextViewDelegate {
    
    func textView(_ textView: UITextView, shouldChangeTextIn range: NSRange, replacementText text: String) -> Bool {
        // get the current text, or use an empty string if that failed
        let currentText = descriptionTV.text ?? ""

        // attempt to read the range they are trying to change, or exit if we can't
        guard let stringRange = Range(range, in: currentText) else { return false }

        let updatedText = currentText.replacingCharacters(in: stringRange, with: text)
        return updatedText.count <= 280
    }
}


//MARK:- TTGTextTagCollectionViewDelegate

extension PostController: TTGTextTagCollectionViewDelegate {
    
}
