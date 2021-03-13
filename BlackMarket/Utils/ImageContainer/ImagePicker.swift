//
//  ImagePicker.swift
//  BlackMarket
//
//  Created by MICHAEL ADU DARKO on 3/11/21.
//

import UIKit

public protocol ImagePickerDelegate: class {
    func didSelect(image: UIImage?)
}

class ImagePicker: NSObject {

    private let pickerController: UIImagePickerController
    private weak var delegate: ImagePickerDelegate?

    public init(delegate: ImagePickerDelegate) {
        self.pickerController = UIImagePickerController()

        super.init()

        self.delegate = delegate

        self.pickerController.delegate = self
        self.pickerController.allowsEditing = false
        self.pickerController.sourceType = .photoLibrary
        self.pickerController.mediaTypes = ["public.image"]
    }

    public func present(from sourceView: UIViewController) {
        sourceView.present(self.pickerController, animated: true)
    }

    private func pickerController(_ controller: UIImagePickerController, didSelect image: UIImage?) {
        controller.dismiss(animated: true, completion: nil)

        self.delegate?.didSelect(image: image)
    }
}

extension ImagePicker: UIImagePickerControllerDelegate {

    public func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        self.pickerController(picker, didSelect: nil)
    }

    public func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        guard let image = info[.originalImage] as? UIImage else {
            return self.pickerController(picker, didSelect: nil)
        }
        self.pickerController(picker, didSelect: image)
    }
}

extension ImagePicker: UINavigationControllerDelegate {

}
