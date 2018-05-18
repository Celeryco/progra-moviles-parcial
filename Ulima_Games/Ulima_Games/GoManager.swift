//
//  GoManager.swift
//  Ulima_Games
//
//  Created by Eros Campos on 16/05/18.
//  Copyright © 2018 Eros Campos. All rights reserved.
//

import Foundation

class GoManager{
    let allStones: [String]
    
    let player: PlayerGo
    
    let playerOneValue: Int

    let playerTwoValue: Int
    
    var matriz: [[Int]]
    
    var arreglito : [[Int : Int]]
    
    //init inicializa las variables de la clase GoManager
    init(){
        matriz = [[0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0],
                  [0,0,0,0,0,0,0,0,0]]
        
        arreglito = []
        
        allStones = ["🌝", "🌚"]
        
        player = PlayerGo(simbolo: allStones[0], turno: 1)
        
        playerOneValue = 0
        
        playerTwoValue = 0
    }
    
    
    func calculatePoints(x:Int, y:Int, color:Int, arreglo:[[Int:Int]]){
        if (matriz[x][y] != color && matriz[x][y] != 0){
            
            print(arreglito)
            
            arreglito.append([x : y])
            
            if(x-1 < 0){
                calculatePoints(x: x - 1, y: y, color: color, arreglo: arreglito)
            }
            
            calculatePoints(x: x + 1, y: y, color: color, arreglo: arreglito)
            
            if(y-1 < 0){
                calculatePoints(x: x, y: y - 1, color: color, arreglo: arreglito)
            }
            
            calculatePoints(x: x, y: y + 1, color: color, arreglo: arreglito)
        }else{
            let tupla = next(position_x:x, position_y:y)
            
            if (tupla.0 < 9 && tupla.1 < 9){
                calculatePoints(x: tupla.0, y: tupla.1, color: color, arreglo: arreglito)
            }
        }
    }
    
    func next(position_x : Int, position_y : Int)->(Int, Int){
        var columna: Int = position_y
        var fila: Int = position_x
        
        if (columna  + 1 < 9){
            return (fila, columna + 1)
        }else{
            fila += 1
            columna = 0
            return (fila, columna)
        }
    }
    
    func updateTable(x: Int, y: Int){
        matriz[x][y] = player.turno
    }
    
    
    
    
    
    //agrupas(x: 0, y:0 , color:2, arreglo:arreglito)
}
