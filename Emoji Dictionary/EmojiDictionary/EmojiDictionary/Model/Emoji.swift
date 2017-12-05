//
//  Emoji.swift
//  EmojiDictionary
//
//  Created by Eric Shorr on 28/11/2017.
//  Copyright © 2017 Developer Institute. All rights reserved.
//



import Foundation

class Emoji : NSObject, NSCoding
{
    var symbol: String
    var name : String
    var emojiDescription : String
    var usage : String
    
    static let DocumentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
    static let ArchiveURL = DocumentsDirectory.appendingPathComponent("emojis")
    
    init(dictionary : Dictionary <String,Any> )
    {
        self.symbol = dictionary["symbol"] as! String
        self.name = dictionary["name"] as! String
        self.emojiDescription = dictionary["emojiDescription"] as! String
        self.usage = dictionary["usage"] as! String
    }
    
    
    
    init(symbol: String, name: String, emojiDescription: String, usage: String )
    {
        self.symbol = symbol
        self.name = name
        self.emojiDescription = emojiDescription
        self.usage = usage
    }
    
    func serialize() -> Dictionary<String,Any>{
        var dict : Dictionary<String,Any> = Dictionary()
       dict["symbol"] = self.symbol
       dict["name"] = self.name
       dict["emojiDescription"] = self.emojiDescription
       dict["usage"] = self.usage
        return dict
    }
    static func openFromUserDefaults() -> [Emoji]?
    {
        var sampleEmojis : [Emoji] = []
        
        if let emojiDicts : [Dictionary<String,Any>] = UserDefaults.standard.object(forKey: "Emoji") as? [Dictionary<String, Any>]
        {
            for dict in emojiDicts
            {
                let emoji : Emoji = Emoji(dictionary: dict)
                sampleEmojis.append(emoji)
            }
        }
        else
        {
            return nil
        }
        
        return sampleEmojis
    }
    
    
    static func saveOnUserDefaults(emojis: [Emoji] )
    {
        // serialize
        
        var emojiDicts : [Dictionary<String,Any>] = []
        
        for emoji : Emoji in emojis
        {
            emojiDicts.append(emoji.serialize())
        }
        
        UserDefaults.standard.set(emojiDicts, forKey: "Emoji")
    }
    
    static func loadFromFile() -> [Emoji]?  {
        //load the data from internal file , NSKeyedUnarchiver.unarchiveObject call the function decode 
        return NSKeyedUnarchiver.unarchiveObject(withFile: Emoji.ArchiveURL.path) as? [Emoji]
    }
    
    //function decode called by NSKeyedUnarchiver.unarchiveObject
    required convenience init?(coder aDecoder: NSCoder) {
        
        guard let symbol = aDecoder.decodeObject(forKey: "symbol") as? String,
            let name = aDecoder.decodeObject(forKey: "name") as? String,
            let detailemojiDescription = aDecoder.decodeObject(forKey: "emojiDescription") as? String,
            let usage = aDecoder.decodeObject(forKey: "usage") as? String
            else {
                return nil
        }
        
        self.init(symbol: symbol, name: name, emojiDescription: detailemojiDescription, usage: usage)
    }
    
    static func saveToFile(emojis: [Emoji]) {
        NSKeyedArchiver.archiveRootObject(emojis, toFile: Emoji.ArchiveURL.path)
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(symbol, forKey: "symbol")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(emojiDescription, forKey: "emojiDescription")
        aCoder.encode(usage, forKey: "usage")
    }
    
    
    
    static func loadFromPList() -> [Emoji]{
        var sampleEmojis : [Emoji] = []
        var emojiArray :[Any] = []
        
        if let path = Bundle.main.path(forResource: "emojis", ofType: "plist"){
            emojiArray = NSArray(contentsOf: URL(fileURLWithPath : path)) as! [Any]
        }
        if let array : [Dictionary<String,Any>] = emojiArray as! [Dictionary<String,Any>]{
            for dict in array{
                let newEmoji = Emoji(dictionary: dict)
                sampleEmojis.append(newEmoji)
            }
        }
        return sampleEmojis
    }
    
   
    
    static func loadSampleEmojis() -> [Emoji] {
        return [Emoji(symbol: "😄", name: "Grinning Face", emojiDescription: "A typical smiley face.", usage: "happiness"),
                Emoji(symbol: "🤨", name: "Confused Face", emojiDescription: "A confused, puzzled face.", usage: "unsure what to think; displeasure"),
                Emoji(symbol: "😍", name: "Heart Eyes", emojiDescription: "A smiley face with hearts for eyes.", usage: "love of something; attractive"),
                Emoji(symbol: "👮‍♀️", name: "Police Officer", emojiDescription: "A police officer wearing a blue cap with a gold badge. He is smiling, and eager to help.", usage: "person of authority"),
                Emoji(symbol: "🐢", name: "Turtle", emojiDescription: "A cute turtle.", usage: "Something slow"),
                Emoji(symbol: "🐘", name: "Elephant", emojiDescription: "A gray elephant.", usage: "good memory"),
                Emoji(symbol: "🍝", name: "Spaghetti", emojiDescription: "A plate of spaghetti.", usage: "spaghetti"),
                Emoji(symbol: "🎲", name: "Die", emojiDescription: "A single die.", usage: "taking a risk, chance; game"),
                Emoji(symbol: "💔", name: "Broken Heart", emojiDescription: "A red, broken heart.", usage: "extreme sadness"),
           
                Emoji(symbol: "🇮🇱", name: "Checkered Flag", emojiDescription: "A black and white checkered flag.", usage: "completion")]
    }
    
    
}
