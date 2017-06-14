//: Playground - noun: a place where people can play

import UIKit

var name = "kknnmmaka"

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

func lyricsForName(lyricsTemplate: String, fullName: String) -> String {
    let shortName = getShortName(for: fullName)
    var lyrics = lyricsTemplate.replacingOccurrences(of: "<FULL_NAME>", with: fullName)
    lyrics = lyrics.replacingOccurrences(of: "<SHORT_NAME>", with: shortName)
    return lyrics
}

print(lyricsForName(lyricsTemplate: bananaFanaTemplate,fullName: "Anurag"));
print("\n")
print(lyricsForName(lyricsTemplate: bananaFanaTemplate,fullName: "Kondeya"));
print("\n")
print(lyricsForName(lyricsTemplate: bananaFanaTemplate,fullName: "Nate"));

