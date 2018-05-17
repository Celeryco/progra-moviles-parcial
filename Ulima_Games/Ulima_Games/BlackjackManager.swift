//
//  BlackjackManager.swift
//  Ulima_Games
//
//  Created by Eros Campos on 16/05/18.
//  Copyright © 2018 Eros Campos. All rights reserved.
//

import Foundation

class BlackjackManager{
    let allSuits: [String]
    
    let allRanks: [String]
    
    var isPlayer: Bool
    
    var houseHand: [Card] = []
    
    var playerValue: Int
    
    var houseValue: Int
    
    var playerHand: [Card] = []
    
    var playerIndex: Int
    
    var youLose: Bool
    
    var youWin: Bool
    
    
    //init inicializa las variables de la clase BlackjackManager
    init(){
        allSuits = ["♠️", "♥️", "♦️", "♣️"]
        
        allRanks = ["A","2","3","4","5","6","7","8","9","10","J","Q","K"]
        
        playerValue = 0
        
        houseValue = 0
        
        playerIndex = 0
        
        youLose = false
        
        youWin = false
        
        isPlayer = true
        
        initializeCards()
    }
    
    //initializeCards se utiliza para inicializar los valores de las cartas que obtendran el jugador y la casa
    func initializeCards(){
        var i = 1
        
        while i < 5  {
            var indiceRank = Int(arc4random_uniform(UInt32(allRanks.count)))
            var indiceSuit = Int(arc4random_uniform(UInt32(allSuits.count)))
            var card = Card(rank: allRanks[indiceRank], suit: allSuits[indiceSuit])
            
            houseHand.append(card)
            
            indiceRank = Int(arc4random_uniform(UInt32(allRanks.count)))
            indiceSuit = Int(arc4random_uniform(UInt32(allSuits.count)))
            card = Card(rank: allRanks[indiceRank], suit: allSuits[indiceSuit])
            
            playerHand.append(card)
            
            i += 1
        }
    }
    
    
    /// machineplay es la funcion que ejecuta las jugadas de la maquina y obtiene los valores de las cartas para utilizarlas en la clase BlackjackController
    ///
    /// - Parameter position: La posicion de la carta en el arreglo de cartas a revisar
    /// - Returns: El valor total de las cartas revisadas
    func machinePlay(position: Int) -> Int{
        isPlayer = false
        
        let card = houseHand[position]
        
        let value = calcPoints(card)
        
        print(value)
        
        return value
    }
    
    
    /// showCard se encarga de mostrar las cartas que va jugando el jugador en la partida, se encarga de que se muestren en orden y ademas de ver si el jugador ya perdio o gano en su ultima jugada
    ///
    /// - Parameter cardTag: La carta que se quiere revisar
    func showCard(cardTag: Int){
        
        if playerIndex != cardTag {
            print("Orden incorrecto")
        }else{
            playerValue = calcPoints(playerHand[playerIndex])
            
            if playerValue > 21 {
                youLose = true
            } else if (playerValue == 21){
                youWin = true
            }
            
            print(playerValue)
            
            playerIndex += 1
        }
        
    }
    
    
    /// calcPoints es una funcion que se encarga de calcular cuanto vale realmente una carta basado en las reglas y logica del blackjack, para luego devolver el valor de la carta a quien lo llamo
    ///
    /// - Parameter showedCard: Carta que se va calcular
    /// - Returns: El valor de la carta calculada
    func calcPoints(_ showedCard: Card)-> Int {
        var value = 0
        if (isPlayer){
            value = playerValue
        }else{
            value = houseValue
        }
        
        if showedCard.rank != "A" {
            if (showedCard.rank == "J" || showedCard.rank == "Q" || showedCard.rank == "K"){
                value += 10
                
            }else{
                value += Int(showedCard.rank)!
            }
        }else {
            if value > 10 {
                value += 1
            }else {
                value += 11
            }
        }
        return value
    }
    
    
    /// reset es una simple funcion que se encarga de resetear a su estado original las variables de la clase BlackjackManager para empezar un nuevo juego
    func reset(){
        playerValue = 0
        
        houseValue = 0
        
        playerIndex = 0
        
        youLose = false
        
        youWin = false
        
        isPlayer = true
        
        playerHand.removeAll()
        
        houseHand.removeAll()
    }
}
