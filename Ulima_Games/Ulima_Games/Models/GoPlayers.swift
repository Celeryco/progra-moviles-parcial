//
//  File.swift
//  Ulima_Games
//
//  Created by Eros Campos on 16/05/18.
//  Copyright © 2018 Eros Campos. All rights reserved.
//

import Foundation

class PlayerGo{
    var simbolo: String
    var turno: Int
    var puntos: Int
    
    init(simbolo: String, turno: Int) {
        self.simbolo = simbolo
        self.turno = turno
        self.puntos = 0
    }
}
