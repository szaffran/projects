//
//  ViewController.swift
//  EmojiDictionary
//
//  Created by Eric Shorr on 28/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//

import UIKit

class ViewController: BaseViewController, UITableViewDelegate,UITableViewDataSource,AddEmojiDelegate,EditEmojiDelegate
{
    
    
    
    

    @IBOutlet weak var tableView: UITableView!
    
//    var emojis: [Emoji] = [Emoji(symbol: "😀", name: "Grinning Face", emojiDescription: "A typical smiley face.", usage: "happiness"), Emoji(symbol: "😕", name: "Confused Face", emojiDescription: "A confused, puzzled face.", usage: "unsure what to think; displeasure"), Emoji(symbol: "😍", name: "Heart Eyes", emojiDescription: "A smiley face with hearts for eyes.", usage: "love of something; attractive")];
//
    
    
    lazy var emojis : [Emoji]? = {
        
        if let loadedEmojis : [Emoji] = Emoji.openFromUserDefaults()//Emoji.loadFromFile()
        {
            return loadedEmojis
        }
        else if let sampleEmojis : [Emoji] = Emoji.openFromUserDefaults()//Emoji.loadSampleEmojis()
        {
            //Emoji.saveToFile(emojis: sampleEmojis)
            Emoji.saveOnUserDefaults(emojis: sampleEmojis)
            return sampleEmojis
        }
        else if let plistEmojis : [Emoji] = Emoji.loadFromPList()
        {
            //Emoji.saveToFile(emojis: plistEmojis)
            Emoji.saveOnUserDefaults(emojis: plistEmojis)
            return plistEmojis
        }
        
        return nil
    }()
    
//    lazy var emojis : [Emoji]? = {
//        if let plistEmoji : [Emoji] = Emoji.loadFromPList(){
//            return plistEmoji
//        }
//        else if let loadedEmojis : [Emoji] = Emoji.loadFromFile(){
//            return loadedEmojis
//        }
//        else if let sampleEmojis : [Emoji] = Emoji.loadSampleEmojis(){
//            Emoji.saveToFile(emojis: sampleEmojis)
//            return sampleEmojis
//        }
//         return [Emoji(symbol: "😀", name: "Grinning Face", emojiDescription: "A typical smiley face.", usage: "happiness"), Emoji(symbol: "😕", name: "Confused Face", emojiDescription: "A confused, puzzled face.", usage: "unsure what to think; displeasure"), Emoji(symbol: "😍", name: "Heart Eyes", emojiDescription: "A smiley face with hearts for eyes.", usage: "love of something; attractive")]
//    }()
    
    
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.tableView.register(NSClassFromString("UITableViewCell"), forCellReuseIdentifier: "Cell")
        
        self.tableView.register(UINib(nibName: "DetailTableViewCell", bundle: Bundle.main), forCellReuseIdentifier: "Cell")
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if let indexPath : IndexPath = self.tableView.indexPathForSelectedRow
        {
            self.tableView.deselectRow(at: indexPath, animated: false)
        }
        
    }

    @IBAction func addEmoji(_ sender: Any)
    {
        self.performSegue(withIdentifier: "addEmojiSegue", sender: nil)
    }
    
    
    //
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return self.emojis!.count
        
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        let cell : DetailTableViewCell = (tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath) as? DetailTableViewCell)!
        // reuses or initializes a new cell
        
        
//        cell.textLabel?.text = "Row \(indexPath.row)"
        
        let emoji : Emoji = self.emojis![indexPath.row]
        // gets the corresponding emoji for the indexpath row
        
        cell.updateWithEmoji(emoji: emoji)
        // has the cell update its label based on the emoji
        
//        cell.textLabel?.text = String(emoji.symbol)
//        cell.detailTextLabel?.text = emoji.description
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath)
    {
        let emoji : Emoji = self.emojis![indexPath.row]
        
        self.performSegue(withIdentifier: "editEmojiSegue", sender: emoji)
    }
    
    
    
    func addEmoji(emoji: Emoji)
    {
       // self.emojis.append(emoji)
        var newArray : [Emoji] = self.emojis!
        newArray.append(emoji)
        self.emojis = newArray
        Emoji.saveToFile(emojis: self.emojis!)
        
        
        self.tableView.reloadData()
    }
    
    func editEmoji(emoji: Emoji)
    {
        self.emojis![(self.tableView.indexPathForSelectedRow?.row)!] = emoji
        
        self.tableView.reloadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        if let editVC : EditEmojiViewController = segue.destination as? EditEmojiViewController
        {
            editVC.emoji = sender as? Emoji
            editVC.delegate = self
        }
        else if let addVC : AddEmojiViewController = segue.destination as? AddEmojiViewController
        {
            addVC.delegate = self
        }
    }
}

