//
//  AddEditTableVC.swift
//  EmojiDictionary
//
//  Created by ronny abraham on 12/3/17.
//  Copyright © 2017 ronny abraham. All rights reserved.
//

import UIKit

class AddEditTableVC: UITableViewController {
    
    var emoji:Emoji?

    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    @IBOutlet weak var symbolTextField: UITextField!
    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var usageTextField: UITextField!
    
    @IBAction func textEditingChanged(_ sender: UITextField) {
        updateSaveButtonState()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        if let emoji = emoji {
            symbolTextField.text = emoji.symbol
            nameTextField.text = emoji.name
            descriptionTextField.text = emoji.description
            usageTextField.text = emoji.usage
        }
        
        updateSaveButtonState()
    }
    
    func updateSaveButtonState() {
        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let desc = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
        
        saveButton.isEnabled = !symbol.isEmpty && !name.isEmpty && !desc.isEmpty && !usage.isEmpty
    }
  
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      
        super.prepare(for: segue, sender: sender)
        
        guard segue.identifier == "saveUnwind" else { return }
        
        let symbol = symbolTextField.text ?? ""
        let name = nameTextField.text ?? ""
        let desc = descriptionTextField.text ?? ""
        let usage = usageTextField.text ?? ""
        
        emoji = Emoji(symbol: symbol, name: name, description: desc, usage: usage)
    }
    

}
