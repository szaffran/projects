//
//  ViewController.swift
//  CvApp
//
//  Created by steph on 21/11/2017.
//  Copyright © 2017 steph. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func goToFormation(_ sender: Any) {
        
        
            performSegue(withIdentifier: "SegueFormation", sender: nil)
       
        
    }
    @IBAction func goToExperience(_ sender: Any) {
        
        performSegue(withIdentifier: "SegueExperience", sender: nil)
    }
}

