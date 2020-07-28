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
                                          color:.orange)

let christmasTheme = EmojiMemoryGameTheme(name:"Christmas",
                                          emojis:["🎄","🎅🏻","🤶🏻","🎁"],
                                          numberOfCards:4,
                                          color:.green)

let cowsTheme = EmojiMemoryGameTheme(name:"Cows",
                                     emojis:["🐄","🐮","🤠","🐂","🐃"],
                                     numberOfCards:5,
                                     color:.yellow)

let flagsTheme = EmojiMemoryGameTheme(name:"Flags",
                                     emojis:["🇦🇽","🇫🇴","🇳🇴","🇸🇪","🇩🇰","🇫🇮"],
                                     numberOfCards:5,
                                     color:.blue)

let fruitTheme = EmojiMemoryGameTheme(name:"Fruit",
                                     emojis:["🍒","🍓","🍐","🍋","🍊","🍈","🍏","🍇","🍉"],
                                     numberOfCards:6,
                                     color:.red)

let vehiclesTheme = EmojiMemoryGameTheme(name:"Vehicles",
                                     emojis:["🚘","🚠","✈️","🚜","⛵️"],
                                     numberOfCards:5,
                                     color:.purple)


let gameThemes = [halloweenTheme,christmasTheme,cowsTheme,fruitTheme,flagsTheme,vehiclesTheme]
let initialTheme = halloweenTheme

class EmojiMemoryGame: ObservableObject{
    @Published private var model: MemoryGame<String> = EmojiMemoryGame.createMemoryGame(theme:initialTheme)
    
    var theme: EmojiMemoryGameTheme = initialTheme
    
    private static func createMemoryGame(theme:EmojiMemoryGameTheme) -> MemoryGame<String>{
        return MemoryGame<String>(numberOfPairsOfCards: theme.numberOfCards){ pairIndex in
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
enum EmojiMemoryGameThemeColor : Int, Codable {
    case yellow
    case green
    case blue
    case orange
    case red
    case purple
}
struct EmojiMemoryGameTheme : Codable {
    var name: String
    var emojis: [String]
    var numberOfCards : Int
    var color: EmojiMemoryGameThemeColor
    
    var colorValue : Color {
        switch(self.color){
        case .blue : return Color.blue
        case .orange: return Color.orange
        case .yellow: return Color.yellow
        case .red: return Color.red
        case .purple: return Color.purple
        case .green: return Color.green
        }
    }
    var json : Data? {
        return try? JSONEncoder().encode(self)
    }
}


