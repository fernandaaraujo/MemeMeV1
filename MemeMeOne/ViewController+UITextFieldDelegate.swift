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
        textField.text = ""
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        
        return true
    }
}
