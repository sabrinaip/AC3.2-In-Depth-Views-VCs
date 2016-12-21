//
//  EmojiDeck.swift
//  ProgrammaticPlayingCards
//
//  Created by Sabrina Ip on 12/20/16.
//  Copyright © 2016 Sabrina. All rights reserved.
//

import Foundation

class EmojiDeck {
    var revealedDeck: [EmojiCard]
    var availableCards: [EmojiCard?]!
    var availableCardsCount = 40
    var topCard: EmojiCard? {
        guard revealedDeck.count > 0 else { return nil }
        return revealedDeck.last
    }
    
    init() {
        self.revealedDeck = [EmojiCard]()
        self.availableCards = self.setUpCards()
    }
    
    func setUpCards() -> [EmojiCard?] {
        var nonShuffledCardsArray = [EmojiCard?]()
        
        for cardNum in 1...10 {
            for suit in 1...4 {
                switch suit {
                case 1:
                    nonShuffledCardsArray.append(EmojiCard(suit: .smiley, cardNum: cardNum))
                case 2:
                    nonShuffledCardsArray.append(EmojiCard(suit: .animal, cardNum: cardNum))
                case 3:
                    nonShuffledCardsArray.append(EmojiCard(suit: .transport, cardNum: cardNum))
                case 4:
                    nonShuffledCardsArray.append(EmojiCard(suit: .electronic, cardNum: cardNum))
                default:
                    continue
                }
            }
        }
        return nonShuffledCardsArray
    }
    
    func drawCard() -> EmojiCard? {
        guard availableCardsCount > 0 else { return nil }
        var randNum = Int(arc4random_uniform(40))
        while availableCards[randNum] == nil {
            randNum = Int(arc4random_uniform(40))
        }
        let newCard = availableCards[randNum]!
        revealedDeck.append(newCard)
        availableCards[randNum] = nil
        self.availableCardsCount -= 1
        dump(newCard)
        return newCard
    }
    
    func showStack() {
        dump(self.revealedDeck)
    }
    
    /* TO DO: write functions for
     showStack
     removeRandom
     removeAll
     */
}

