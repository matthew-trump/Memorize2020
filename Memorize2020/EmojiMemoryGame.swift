//
//  EmojiMemoryGame.swift
//  Memorize
//
//  Created by Matthew Trump on 7/10/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import SwiftUI

let halloweenTheme = EmojiMemoryGameTheme(name:"Halloween",
                                          emojis:["👻","🎃","🕷","🗝","💀"],
                                          numberOfCards: 5,
                                          color: UIColor.RGB(red: 1, green: 0.5, blue: 0, alpha: 1.0))

let christmasTheme = EmojiMemoryGameTheme(name:"Christmas",
                                          emojis:["🎄","🎅🏻","🤶🏻","🎁"],
                                          numberOfCards:4,
                                          color: UIColor.RGB(red: 1, green: 0, blue: 0, alpha: 1.0))

let cowsTheme = EmojiMemoryGameTheme(name:"Cows",
                                     emojis:["🐄","🐮","🤠","🐂","🐃"],
                                     numberOfCards:5,
                                     color: UIColor.RGB(red: 1, green: 0, blue: 1, alpha: 1.0))

let flagsTheme = EmojiMemoryGameTheme(name:"Flags",
                                     emojis:["🇦🇽","🇫🇴","🇳🇴","🇸🇪","🇩🇰","🇫🇮"],
                                     numberOfCards:5,
                                     color: UIColor.RGB(red: 0, green: 1, blue: 1, alpha: 1.0))

let fruitTheme = EmojiMemoryGameTheme(name:"Fruit",
                                     emojis:["🍒","🍓","🍐","🍋","🍊","🍈","🍏","🍇","🍉"],
                                     numberOfCards:6,
                                     color:UIColor.RGB(red: 0, green: 0, blue: 1, alpha: 1.0))

let vehiclesTheme = EmojiMemoryGameTheme(name:"Vehicles",
                                     emojis:["🚘","🚠","✈️","🚜","⛵️"],
                                     numberOfCards:5,
                                     color: UIColor.RGB(red: 0, green: 1, blue: 0, alpha: 1.0))


let gameThemes = [halloweenTheme,christmasTheme,cowsTheme,fruitTheme,flagsTheme,vehiclesTheme]
let initialTheme = halloweenTheme

class EmojiMemoryGame: ObservableObject{
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(theme:initialTheme)
    
    var theme: EmojiMemoryGameTheme = initialTheme
    
    private static func createMemoryGame(theme:EmojiMemoryGameTheme) -> MemoryGame<String>{
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfCards){ pairIndex in
            print("THEME json = \(theme.json?.utf8 ?? "nil")")
            return theme.emojis[pairIndex]
        }
    }
    
    //MARK: - Access to the Model
    var cards: Array<MemoryGame<String>.Card>{
        model.cards
    }
    var score: Int {
        model.score
    }
    //MARK: - Intent(s)
    
    func choose(card: MemoryGame<String>.Card){
        model.choose(card: card)
    }
    func resetGame(){
        theme = gameThemes.randomElement()!
        
        model = EmojiMemoryGame.createMemoryGame(theme:theme)
    }
}
struct EmojiMemoryGameTheme : Codable {
    var name: String
    var emojis: [String]
    var numberOfCards : Int
    var color: UIColor.RGB
    
    var json : Data? {
        return try? JSONEncoder().encode(self)
    }
}


