//
//  MichiPlayerModel.swift
//  Ulima_Games
//
//  Created by Eros Campos on 16/05/18.
//  Copyright © 2018 Eros Campos. All rights reserved.
//
import Foundation
import UIKit

class Player{
    var simbolo: Character
    var turno: Int
    
    
    init(simbolo: Character, turno: Int) {
        self.simbolo = simbolo
        self.turno = turno
    }
}
