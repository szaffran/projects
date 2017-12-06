//
//  ViewController.swift
//  FormScrollView
//
//  Created by Adrien Meyer on 05/12/2017.
//  Copyright © 2017 Developer.Institute. All rights reserved.
//

import UIKit

class ViewController: BaseViewController, UITextFieldDelegate {

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet var contentContainer: UIView!
    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var lblDate: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.contentContainer.autoresizingMask = UIViewAutoresizing(rawValue: UIViewAutoresizing.RawValue(UInt8(UIViewAutoresizing.flexibleWidth.rawValue) | UInt8(UIViewAutoresizing.flexibleHeight.rawValue)))
        
        
        // define the position of the contentContainer begining at 0,0 and  x=height, y=width
        self.contentContainer.frame = CGRect(x: 0, y: 0, width: self.contentContainer.frame.size.width, height: self.contentContainer.frame.size.height)
        
        //define size of scrollView = size of the contentContainer
        self.scrollView.contentSize = self.contentContainer.frame.size
        
        //map the contentContenair inside the scrollView
        self.scrollView.addSubview(self.contentContainer)
        
    }
    
    
    @IBAction func dayChanged(_ sender: Any) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        dateFormatter.timeStyle = .full
        
       
        self.lblDate.text = dateFormatter.string(from: self.datePicker.date)
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        if let linkedTextField: LinkedTextField = textField as? LinkedTextField{
            if(linkedTextField.nextField != nil){
                linkedTextField.nextField?.becomeFirstResponder()
            }
            else{
                linkedTextField.resignFirstResponder()
            }
            
        }
        return true
    }
}

