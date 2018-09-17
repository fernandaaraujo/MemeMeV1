//
//  ViewController+ImagePickerControllerDelegate.swift
//  MemeMeOne
//
//  Created by Fernanda Araújo on 17/09/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UIImagePickerControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        if let image = info[UIImagePickerControllerOriginalImage] as? UIImage {
            loadPreviewImage(image: image)
        }
        
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
    
    func generateMemedImage() -> UIImage {
        self.toolBar.isHidden = true
        
        UIGraphicsBeginImageContext(self.view.frame.size)
        view.drawHierarchy(in: self.view.frame, afterScreenUpdates: true)
        let memedImage:UIImage = UIGraphicsGetImageFromCurrentImageContext()!
        UIGraphicsEndImageContext()
        
        self.toolBar.isHidden = false
        
        return memedImage
    }
    
    func save(image: UIImage) {
        let meme = Meme(topText: textTop.text!, bottomText: textBottom.text!, originalImage: memeImage.image!, memedImage: image)
        
        let object = UIApplication.shared.delegate
        let appDelegate = object as! AppDelegate
        appDelegate.memes.append(meme)
    }
    
    func loadPreviewImage(image: UIImage) {
        memeImage.image = image
        shareButton.isEnabled = true
        cancelButton.isEnabled = true
    }
}
