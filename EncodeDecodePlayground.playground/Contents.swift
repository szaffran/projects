//: Playground - noun: a place where people can play

import UIKit

struct Note: Codable {
    let title: String
    let text: String
    let timestamp: Date
}

let newNote = Note(title: "Grocery run", text: "Pick up mayonnaise, mustard, lettuce, tomato, and pickles.", timestamp:  Date())

let propertyListEncoder = PropertyListEncoder()

if let encodedNote = try? propertyListEncoder.encode(newNote) {
    print(encodedNote)
    let propertyListDecoder = PropertyListDecoder()
    if let decodedNote = try?
        propertyListDecoder.decode(Note.self, from: encodedNote) {
        print(decodedNote)
    }
}





let documentsDirectory =   FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
let archiveURL = documentsDirectory.appendingPathComponent("notes_test").appendingPathExtension("plist")

let filePropertyListEncoder = PropertyListEncoder()
let fileEncodedNote: Data? = try? filePropertyListEncoder.encode(newNote)
print(fileEncodedNote!)

try? fileEncodedNote?.write(to: archiveURL,options: .noFileProtection)
let filePropertyListDecoder = PropertyListDecoder()

if let fileRetrievedNoteData = try? Data(contentsOf: archiveURL), let fileDecodedNote = try? filePropertyListDecoder.decode(Note.self, from: fileRetrievedNoteData) {
    print(fileDecodedNote)
}
