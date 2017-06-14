//
//  ViewController.swift
//  Silly Song
//
//  Created by Anurag Kondeya on 12/6/17.
//  Copyright © 2017 Anurag Kondeya. All rights reserved.
//

import UIKit

let bananaFanaTemplate = [
    "<FULL_NAME>, <FULL_NAME>, Bo B<SHORT_NAME>",
    "Banana Fana Fo F<SHORT_NAME>",
    "Me My Mo M<SHORT_NAME>",
    "<FULL_NAME>"].joined(separator: "\n")

func getShortName(for name:String)->String{
    let name = name;
    let vowelSet = CharacterSet(charactersIn: "aeiou")
    
    if let index = name.lowercased().rangeOfCharacter(from: vowelSet)?.lowerBound {
        return name.substring(from: index)
    }
    
    return""
    
}

// MARK: - UITextFieldDelegate
extension ViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return false
    }
}

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = getShortName(for: fullName)
    var lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    lyrics = lyrics.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return lyrics
}


class ViewController: UIViewController {
    
    
    @IBOutlet weak var lyricsView: UITextView!
 
    @IBOutlet weak var nameField: UITextField!
    

    override func viewDidLoad() {
        super.viewDidLoad()
       nameField.delegate = self
    }
    


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    @IBAction func reset(_ sender: Any) {
        
        nameField.text = ""
        lyricsView.text = ""
        
        
    }
    

    
    @IBAction func displayLyrics(_ sender: Any) {
    
        let nameEntered: String = nameField.text!
        if !nameEntered.isEmpty{
            lyricsView.text = lyricsForName(lyricsTemplate: bananaFanaTemplate,fullName: nameEntered)
        }
    
    
    }
    
    

}

