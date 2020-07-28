//
//  EmojiMemoryGameExtensions.swift
//  Memorize2020
//
//  Created by Matthew Trump on 7/28/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import Foundation

extension Data {
    // just a simple converter from a Data to a String
    var utf8: String? { String(data: self, encoding: .utf8 ) }
}
