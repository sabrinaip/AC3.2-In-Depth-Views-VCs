//
//  EmojiCard.swift
//  ProgrammaticPlayingCards
//
//  Created by Sabrina Ip on 12/20/16.
//  Copyright © 2016 Sabrina. All rights reserved.
//

import Foundation

class EmojiCard {
    let suit: Suit
    let cardNum: Int // 1 - 10
    
    init(suit: Suit, cardNum: Int) {
        self.suit = suit
        self.cardNum = cardNum
    }
    
    enum Suit: String {
        case smiley = "😬"
        case animal = "🐱"
        case transport = "🚗"
        case electronic = "📱"
    }

}
