//
//  PostController.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 2/1/21.
//


import UIKit
import TTGTagCollectionView
import SCLAlertView


class PostController: UIViewController, UITextFieldDelegate {
     
    //MARK:- Properties
    
//    var selectedImage: UIImage? {
//        didSet { imageContainerViewController.image = selectedImage}
//    }
    
    let stackScrollView = StackScrollView()
    
    private var imagePicker: ImagePicker?
     
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
    
    private let imageContainerViewController: ImageContainerViewController = {
        let container = ImageContainerViewController()
        container.view.translatesAutoresizingMaskIntoConstraints = false
        return container
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
        tf.widthAnchor.constraint(equalToConstant: 10).isActive = true
        return tf
    }()
    
    
    private let descriptionTV: DescriptionTextView = {
        let tv = DescriptionTextView()
        tv.autocorrectionType = .no
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
        
        imageContainerViewController.delegate = self
    }
    
    
    
    //MARK:- Selectors
    @objc func handleCancelButton(){
         navigationController?.dismiss(animated: true, completion: nil)
    }

    @objc func handleDoneButton(){
        guard let image = imageContainerViewController else {return}
        guard let title = listItemTitle.text else { return }
        guard let itemPrice = price.text else { return }
        guard let description = descriptionTV.text else { return }
        
        showLoader(true, withText: "Loading...")
        
        UploadItemService.uploadItem(image: image, title: title, price: itemPrice, description: description) { error in
            
            if let  error = error {
                self.showLoader(false)
                SCLAlertView().showError(error.localizedDescription)
                return
            }
            self.showLoader(false)
            self.dismiss(animated: true, completion: nil)
        }
    }
    
    @objc func tapDone(sender: Any) {
            self.view.endEditing(true)
        }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }

    
    @objc func keyboardwillhide(){
        stackScrollView.contentInset = .zero
    }
    
    @objc func keyboardWillShow(notification: NSNotification) {
            guard let keyboardFrame = notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue else { return }
            stackScrollView.contentInset.bottom = view.convert(keyboardFrame.cgRectValue, from: nil).size.height
        }
    
    //MARK:- Helpers
    
    private func configureUI(){
        navigationController?.navigationBar.barTintColor = .backgroundColor
        view.backgroundColor = .backgroundColor
       
        navigationItem.leftBarButtonItem = leftBarButtonItem(selector: #selector(handleCancelButton))
        navigationItem.rightBarButtonItem = rightBarButtonItem(selector: #selector(handleDoneButton))
        
        stackScrollView.backgroundColor = .backgroundColor
        view.addSubview(stackScrollView)
        NSLayoutConstraint.activate([
            stackScrollView.topAnchor.constraint(equalTo: view.topAnchor),
            stackScrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackScrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackScrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        stackScrollView.insertView(imageContainerViewController.view)
        NSLayoutConstraint.activate([
            imageContainerViewController.view.topAnchor.constraint(equalTo: stackScrollView.topAnchor, constant: 10),
            imageContainerViewController.view.leadingAnchor.constraint(equalTo: stackScrollView.leadingAnchor, constant: 5),
            imageContainerViewController.view.trailingAnchor.constraint(equalTo: stackScrollView.trailingAnchor, constant: -5),
            imageContainerViewController.view.heightAnchor.constraint(equalToConstant: 350),
        ])

        let stackView = UIStackView(arrangedSubviews: [listItemTitle, price, categoryTag,descriptionTV])
        stackView.axis = .vertical
        stackView.spacing = 10
        stackScrollView.insertView(stackView)
        
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
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
        return updatedText.count <= 240
    }
}


//MARK:- TTGTextTagCollectionViewDelegate

extension PostController: TTGTextTagCollectionViewDelegate {
    
}

// MARK: - ImageContainerDelegate
extension PostController: ImageContainerDelegate {
    func didTapContainer() {
        imagePicker = ImagePicker(delegate: self)
        imagePicker?.present(from: self)
    }
}

// MARK: - ImagePickerDelegate
extension PostController: ImagePickerDelegate {
    func didSelect(image: UIImage?) {
        guard let _image = image else { return }
        
        self.imageContainerViewController.update(with: [_image])
    }
}

extension PostController {
    
    private func leftBarButtonItem(selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setDimensions(height: 40, width: 40)
        button.tintColor = .white
        button.imageView?.setDimensions(height: 26, width: 26)
        button.layer.cornerRadius = 40 / 2
        button.backgroundColor = .systemRed
        button.setImage(UIImage(systemName: "xmark"), for: .normal)
        
        return makeBarButtonItem(button: button, selector: selector)
    }
    
    private func rightBarButtonItem(selector: Selector) -> UIBarButtonItem {
        let button = UIButton(type: .custom)
        button.setDimensions(height: 40, width: 40)
        button.imageView?.setDimensions(height: 26, width: 26)
        button.layer.cornerRadius = 40 / 2
        button.tintColor = .white
        button.backgroundColor = .systemGreen
        button.setImage(UIImage(systemName: "checkmark"), for: .normal)
        
        return makeBarButtonItem(button: button, selector: selector)
    }
    
    private func makeBarButtonItem(button: UIButton, selector: Selector) -> UIBarButtonItem {
        button.addTarget(self, action: selector, for: .touchUpInside)
        
        return UIBarButtonItem(customView: button)
    }
}

