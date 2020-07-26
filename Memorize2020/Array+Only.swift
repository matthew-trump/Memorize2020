//
//  Array+Only.swift
//  Memorize
//
//  Created by Matthew Trump on 7/13/20.
//  Copyright © 2020 Matthew Trump. All rights reserved.
//

import Foundation

extension Array {
    var only: Element? {
        count == 1 ? first : nil
    }
}
