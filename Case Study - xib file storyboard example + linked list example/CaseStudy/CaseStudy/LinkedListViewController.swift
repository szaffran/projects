//
//  LinkedListViewController.swift
//  CaseStudy
//
//  Created by Eric Shorr on 22/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class LinkedListViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var txtFld1: LinkedTextField!
    @IBOutlet weak var txtFld2: LinkedTextField!
    
    @IBAction func close(_ sender: Any)
    {
        self.dismiss(animated: true) {
            
        }
    }
    
    @IBAction func firstTextFieldDidEnd(_ sender: Any)
    {
        print(self.txtFld1.text)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        
        print("return sent")
        
        if let linkedTextField : LinkedTextField = textField as? LinkedTextField
        {
            if( linkedTextField.nextField != nil )
            {
                linkedTextField.nextField?.becomeFirstResponder()
            }
            else
            {
                linkedTextField.resignFirstResponder()
            }
        }
        
        
        
        /*
        if( textField == self.txtFld1 )
        {
            self.txtFld2.becomeFirstResponder()
        }
        else if( textField == self.txtFld2 )
        {
            self.txtFld2.resignFirstResponder()
        }
        */
        
//    self.txtFld2.becomeFirstResponder()
//        self.txtFld1.resignFirstResponder()
        
        return true
    }

}
