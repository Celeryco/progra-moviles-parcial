//
//  MichiManager.swift
//  Ulima_Games
//
//  Created by Eros Campos on 16/05/18.
//  Copyright © 2018 Eros Campos. All rights reserved.
//
import UIKit
import Foundation

class MichiManager{
    //Se define variables
    var jugadorTurno: Int
    var tablero:[Character?]
    var n : Int
    var themeApp: Theme
    var jugadorActual: Player
    
    //Se inicializa variables y tablero
    init(){
        jugadorTurno = 1

        themeApp = Theme(background: UIColor.orange, blockSymbol: "🌚", playerOneSymbol: "🐶", playerTwoSymbol: "🎃")
        
        jugadorActual = Player(simbolo: themeApp.playerOneSymbol, turno: 1)
        
        tablero = [Character?](repeating: themeApp.blockSymbol, count: 9)
        
        n = Int(sqrt(Double(tablero.count)))
        
        inicializarTabla()
    }
    func inicializarTabla(){
        for i in 0..<n{
            tablero[i] = themeApp.blockSymbol
        }
    }
    
    //Se realiza una jugada en el tablero
    func realizarJugada(posicion: Int) -> Bool{
        var boo: Bool = false
        
        if jugadorTurno == 1 {
            jugadorActual.simbolo = themeApp.playerOneSymbol
            jugadorActual.turno = 1
        }else{
            jugadorActual.simbolo = themeApp.playerTwoSymbol
            jugadorActual.turno = 2
        }
        
        if tablero[posicion] == themeApp.blockSymbol{
            tablero[posicion] = jugadorActual.simbolo
            boo = verificarGanador()
            
            if jugadorActual.turno == 1{
                jugadorTurno = 2
            }else{
                jugadorTurno = 1
            }
        }
        return boo
    }
    
    //Se llama a todos los metodos de posibles situaciones para ganar, y se devuelve un boolean que define si un jugador gano o no
    func verificarGanador() -> Bool{
        var boo: Bool = false
        
        if verificarGanadorDI() || verificarGanadorDD() || verificarGanadorVertical() || verificarGanadorHorizontal(){
            boo = true
        }else{
            boo = false
        }
        return boo
    }
    
    //Se verifica horizontalmente las casillas del tablero
    func verificarGanadorHorizontal() -> Bool{
        var boo: Bool
        
        for i in 0..<n{
            boo = true
            for j in 0..<n{
                if tablero[i*3 + j]! != jugadorActual.simbolo{
                    boo = false
                }
            }
            if boo{
                return true
            }
        }
        return false
    }
    
    //Se verifica verticalmente las casillas del tablero
    func verificarGanadorVertical() -> Bool{
        var boo: Bool
        
        for i in 0..<n{
            boo = true
            for j in 0..<n{
                if tablero[i + j*3]! != jugadorActual.simbolo{
                    boo = false
                }
            }
            if boo{
                return true
            }
        }
        return false
    }
    
    //Se verifica horizontalmente diagonalmente por la izquierda las casillas del tablero
    func verificarGanadorDI() -> Bool{
        var boo: Bool = true
        
        for i in 0..<n{
            if tablero[i*3 + i]! != jugadorActual.simbolo{
                boo = false
            }
            if !boo{
                return false
            }
        }
        return true
    }
    
    //Se verifica horizontalmente diagonalmente por la derecha las casillas del tablero
    func verificarGanadorDD() -> Bool{
        var boo: Bool = true
        
        for i in 0..<n{
            if tablero[2 + i*2]! != jugadorActual.simbolo{
                boo = false
            }
            if !boo{
                return false
            }
        }
        return true
    }
    
    
    //Metodo para reiniciar el tablero
    func vaciar(){
        jugadorTurno = 1
        for i in 0..<tablero.count{
            tablero[i] = themeApp.blockSymbol
        }
    }
}
