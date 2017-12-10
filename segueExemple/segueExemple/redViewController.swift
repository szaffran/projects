//
//  redViewController.swift
//  segueExemple
//
//  Created by steph on 20/11/2017.
//  Copyright © 2017 steph. All rights reserved.
//

import UIKit

class redViewController: UIViewController {

    @IBOutlet weak var lblYouFoundMe: UILabel!
    
    var youFoundMe = "you found me"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.lblYouFoundMe.text = youFoundMe
    }
    
    @IBAction func back(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
}
