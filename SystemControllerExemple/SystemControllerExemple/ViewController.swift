//
//  ViewController.swift
//  SystemControllerExemple
//
//  Created by steph on 04/12/2017.
//  Copyright © 2017 steph. All rights reserved.
//

import UIKit
import MessageUI

class ViewController: UIViewController, UIImagePickerControllerDelegate, UINavigationControllerDelegate, MFMailComposeViewControllerDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
  
    @IBOutlet weak var shareButton: UIButton!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBAction func takePhoto(_ sender: Any) {
        
        let picker : UIImagePickerController = UIImagePickerController()
        picker.delegate = self
        
        picker.sourceType = .camera
        self.present(picker,animated:true, completion : nil)
    }
    
   
    @IBAction func getPhoto(_ sender: Any) {
        
        let picker : UIImagePickerController = UIImagePickerController()
        picker.delegate = self
        
        picker.sourceType = .photoLibrary
        self.present(picker,animated:true, completion : nil)
        
    }
   
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [String : Any]) {
        
        guard let selectedImage = info[UIImagePickerControllerOriginalImage] as? UIImage
            else{return}
        self.imageView.image = selectedImage
        
        self.shareButton.isEnabled = true
        picker.dismiss(animated: true, completion: nil)        
    }
    
    
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        picker.dismiss(animated: true, completion: nil)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func email(_ sender: Any) {
        
        guard MFMailComposeViewController.canSendMail() else{return}
        
        let mailVC : MFMailComposeViewController = MFMailComposeViewController()
        mailVC.mailComposeDelegate = self
        if self.shareButton.isEnabled{
            let imageData : Data = UIImagePNGRepresentation(self.imageView.image!) as! Data
            
                mailVC.addAttachmentData(imageData, mimeType: "png", fileName: "mySharedImage")
        }
    
        
        self.present(mailVC, animated: true, completion: nil)
 
    }
    
    
    @IBAction func shareImage(_ sender: UIView) {
        
        guard let image = self.imageView.image else { return }
        let activityController =
            UIActivityViewController(activityItems: [image],
                                     applicationActivities: nil)
        activityController.popoverPresentationController?.sourceView
            = sender
        
        present(activityController, animated: true, completion: nil)
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

