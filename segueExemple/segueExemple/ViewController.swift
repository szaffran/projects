//
//  ViewController.swift
//  segueExemple
//
//  Created by steph on 20/11/2017.
//  Copyright © 2017 steph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textField: UITextField!
   
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    @IBAction func nextView(_ sender: Any) {
        
        self.performSegue(withIdentifier: "redSegue", sender: nil)
    }
    
    @IBAction func goBlue(_ sender: Any) {
        self.performSegue(withIdentifier: "blueSegue", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "redSegue"{
            if let vc : redViewController = segue.destination as? redViewController
            {
                if let text : String = self.textField.text
                {
                    vc.youFoundMe = text
                }
            }
        }
    }
}

