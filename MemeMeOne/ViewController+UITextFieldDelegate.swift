//
//  ViewController+UITextFieldDelegate.swift
//  MemeMeOne
//
//  Created by Fernanda Araújo on 17/09/18.
//  Copyright © 2018 Udacity. All rights reserved.
//

import Foundation
import UIKit

extension ViewController: UITextFieldDelegate {
    func textFieldDidBeginEditing(_ textField: UITextField) {
        textBottom.text = (textBottom.text?.isEmpty)! ? "" : textBottom.text
        textTop.text = (textTop.text?.isEmpty)! ? "" : textTop.text
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textBottom.resignFirstResponder()
        textTop.resignFirstResponder()
        
        return true
    }
}
