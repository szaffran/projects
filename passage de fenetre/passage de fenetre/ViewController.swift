//
//  ViewController.swift
//  passage de fenetre
//
//  Created by steph on 20/11/2017.
//  Copyright © 2017 steph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet weak var lblText: UILabel!
    
    
//    function to exit
    @IBAction func unwindToRed(unwindSegue: UIStoryboardSegue) {
        
    }
    
    
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//            let text = lblText.text
//
//
//        if segue.identifier == "redSegue"{
//            if let vc : redViewController = segue.destination as? redViewController
//            {
//                if let text : String = self.textField.text
//                {
//                    vc.youFoundMe = text
//                }
//            }
//        }
//
//
//    }
    
    
}

