//
//  ViewController.swift
//  SystemViewControllers
//
//  Created by steph on 10/12/2017.
//  Copyright © 2017 steph. All rights reserved.
//

import UIKit
import SafariServices

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

  
    

    @IBAction func shareButtonAction(_ sender: UIButton) {
        
        guard let image = imageView.image else{return}
        
        let activityController = UIActivityViewController(activityItems:[image], applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView = sender
        
        present(activityController,animated: true, completion: nil)
        
    }
    
    @IBAction func safariButtonAction(_ sender: Any) {
        
        if let url = URL(string: "http://www.apple.com"){
            let safariVC = SFSafariViewController(url: url)
             present(safariVC, animated: true, completion: nil)
        }
        
    }
    
    @IBAction func photoButtonAction(_ sender: UIButton) {
        
        let alertController = UIAlertController(title: "choose image", message: nil, preferredStyle: .actionSheet )
        let cancelAction = UIAlertAction(title: "cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        alertController.popoverPresentationController?.sourceView = sender
        
         present(alertController, animated: true, completion: nil)
        
    }
    
    @IBAction func emailButtonAction(_ sender: Any) {
        
        
    }
    
    
}

