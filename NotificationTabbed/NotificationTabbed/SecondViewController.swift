//
//  SecondViewController.swift
//  NotificationTabbed
//
//  Created by Adrien Meyer on 06/12/2017.
//  Copyright © 2017 Developer.Institute. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController
{
    
    @IBOutlet weak var lblMessage: UILabel!
    var message : String?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        NotificationCenter.default.addObserver(self, selector: #selector(messageReceived(_:)), name: NSNotification.Name(rawValue: "MessageToViewController2"), object: nil)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if(self.message != nil){
            self.lblMessage.text = self.message
            self.message = nil
        }

        // Do any additional setup after loading the view.
        
        NotificationCenter.default.addObserver(self, selector : #selector(messageReceived(_:)), name: NSNotification.Name(rawValue: "MessageToViewController2"), object: nil)
    }

    @objc func messageReceived(_ notification: NSNotification)
    {
        let txtMessage : String = notification.object as! String
        print(txtMessage)
        
        if(self.lblMessage != nil){
            self.lblMessage.text = txtMessage
        }
        else{
            self.message = txtMessage
        }
        
        
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
