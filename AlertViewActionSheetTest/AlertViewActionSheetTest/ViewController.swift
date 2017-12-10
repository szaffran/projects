//
//  ViewController.swift
//  AlertViewActionSheetTest
//
//  Created by steph on 10/12/2017.
//  Copyright © 2017 steph. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {


   
    
    @IBAction func alertView(_ sender: Any) {
        
      let alertView = UIAlertController(title: "welcome", message: "to the thunderdome", preferredStyle: .alert)
        
//
       let cancelAction = UIAlertAction(title: "Cancel",style: .cancel, handler: nil)

        alertView.addAction(cancelAction)
      
        let okAction = UIAlertAction(title: "ok",style: .default, handler: {action in print("ok corral")})
        
        alertView.addAction(okAction)
       
        
        self.present(alertView,animated: true,completion: nil)
    }
    
    
    
    @IBAction func actionSheet(_ sender: Any) {
        
        let alertView = UIAlertController(title: "welcome", message: "to my house", preferredStyle: .actionSheet)
        
        //
        let cancelAction = UIAlertAction(title: "Cancel",style: .cancel, handler: nil)
        
        alertView.addAction(cancelAction)
        
        let okAction = UIAlertAction(title: "ok",style: .default, handler: {action in print("ok corral")})
        
        alertView.addAction(okAction)
        
        let safariAction = UIAlertAction(title: "open web browser",style: .default, handler: {action in print("ok corral")
            
            let safariVC : SFSafariViewController = SFSafariViewController(url: URL(string : "http://www.youtube.com")!)
             self.present(safariVC,animated: true,completion: nil)
        
        })
        
        alertView.addAction(safariAction)
        
        
        self.present(alertView,animated: true,completion: nil)
        
    }
}

