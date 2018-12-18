//
//  Card.swift
//  Concentrate
//
//  Created by apple on 2018/11/22.
//  Copyright © 2018年 huuuuu. All rights reserved.
//

import Foundation
//At this stage
struct Card {
    //If facing up
    var isFaceUp = false
    //match?
    var isMatched = false
    var identifier: Int
    static var identifierFactory = 0
    
    static func getUniqueIdentifier() -> Int {
            identifierFactory += 1
            return identifierFactory
    }
    init(){
        self.identifier = Card.getUniqueIdentifier()
    }
}
