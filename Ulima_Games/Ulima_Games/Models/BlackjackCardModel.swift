//
//  BlackjackCardModel.swift
//  Ulima_Games
//
//  Created by Eros Campos on 16/05/18.
//  Copyright © 2018 Eros Campos. All rights reserved.
//

import Foundation
class Card : NSObject{
    //Card properties and methods
    let rank: String, suit: String
    
    init (rank: String, suit: String) {
        self.rank = rank
        self.suit = suit
        super.init()
    }
}
