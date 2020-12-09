//
//  PhotoPickerService.swift
//  Namshi
//
//  Created by MacBook on 12/9/20.
//

import Foundation
import UIKit
import RxSwift

class PhotoPickerService: NSObject, UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    private let selectedPhotoSubject = PublishSubject<UIImage>()
    var selectedPhoto: Observable<UIImage> {
        return selectedPhotoSubject.asObserver()
    }
    
    func pickImageFromGallery() {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerController.SourceType.photoLibrary) {
            let vc = UIApplication.getTopViewController()
            let imagePicker = UIImagePickerController()
            imagePicker.delegate = self
            imagePicker.sourceType = UIImagePickerController.SourceType.photoLibrary
            vc?.present(imagePicker, animated: true, completion: nil)
        }
    }
    
    func imagePickerController(_ picker: UIImagePickerController,
                               didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let pickedImage = info[UIImagePickerController.InfoKey(rawValue:
           UIImagePickerController.InfoKey.originalImage.rawValue)] as? UIImage {
            picker.dismiss(animated: true, completion: { [weak self] in
                self?.selectedPhotoSubject.onNext(pickedImage) })
        }
    }
}
