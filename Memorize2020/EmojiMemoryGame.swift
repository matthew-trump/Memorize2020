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
                                          numberOfCards:Int.random(in: 3...5),
                                          color:Color.orange)

let christmasTheme = EmojiMemoryGameTheme(name:"Christmas",
                                          emojis:["🎄","🎅🏻","🤶🏻","🎁"],
                                          numberOfCards:4,
                                          color:Color.green)

let cowsTheme = EmojiMemoryGameTheme(name:"Cows",
                                     emojis:["🐄","🐮","🤠","🐂","🐃"],
                                     numberOfCards:5,
                                     color:Color.yellow)

let gameThemes = [halloweenTheme,christmasTheme,cowsTheme]
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

struct EmojiMemoryGameTheme {
    var name: String
    var emojis: [String]
    var numberOfCards : Int
    var color: Color
}


