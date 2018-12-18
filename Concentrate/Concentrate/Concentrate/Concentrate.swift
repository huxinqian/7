//
//  Concentrate.swift
//  Concentrate
//
//  Created by apple on 2018/11/22.
//  Copyright © 2018年 huuuuu. All rights reserved.
//

import Foundation  //与UI无关，实现功能
class Concentrate
{
    var cards = [Card]()
    
    var indexOfOneAndOnlyFacedUpCard: Int?
    
    func chooseCard(at index: Int){
        if  !cards[index].isMatched {
            //going to go up to the only one
            if let matchIndex = indexOfOneAndOnlyFacedUpCard,matchIndex != index {
                //check  match
                if cards[matchIndex].identifier == cards[index].identifier {
                    cards[matchIndex].isMatched = true
                    cards[index].isMatched = true
                }
                cards[index].isFaceUp = true
                indexOfOneAndOnlyFacedUpCard = nil //There are two CARDS that match or do not match face up. There is no choice
            }else{
                //don't have CARDS facing up or I have two CARDS facing up
                for flipDownIndex in cards.indices {
                    cards[flipDownIndex].isFaceUp = false
                    cards[index].isFaceUp = true //face up the one that I chose
                    indexOfOneAndOnlyFacedUpCard = index
                }
            }
        }
    }
    init(numberOfPairsOfCards: Int){
        for _ in 1...numberOfPairsOfCards {
            let card = Card()
//            cards.append(card)
//            cards.append(card)
              cards += [card, card] //Simplify these two lines of code to one line
        }
    }
}
