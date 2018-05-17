//
//  BlackjackViewController.swift
//  Ulima_Games
//
//  Created by Eros Campos on 16/05/18.
//  Copyright © 2018 Eros Campos. All rights reserved.
//

import UIKit

class BlackjackViewController: UIViewController, onTapDelegate {
    @IBOutlet weak var playerLabel: UILabel!
    
    @IBOutlet weak var blackjackLabel: UILabel!
    
    @IBOutlet weak var buttonStay: UIButton!
    
    var name = ""
    
    var playerViews: [CardView]
    
    var houseViews: [CardView]
    
    var blackjackManager: BlackjackManager
    
    var finalValuePlayer: Int
    
    var finalValueMachine: Int
    
    //Inicializacion de variables
    required init?(coder aDecoder: NSCoder) {
        self.blackjackManager = BlackjackManager()
        
        playerViews =  [CardView]()
        
        houseViews =  [CardView]()
        
        finalValuePlayer = 0
        
        finalValueMachine = 0
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Genera las cartas en blackjackManager
        blackjackManager.initializeCards()
        initGrid()
    }
    
    
    /// initGrid() se encarga de crear las vistas de las ViewCards y asignarles sus valores respectivos a las variables dentro de esta.
    func initGrid(){
        for i in 0...1{
            for j in 0...3 {
                if let view = Bundle.main.loadNibNamed("BlackjackCardView", owner: self, options: nil)?.first as? CardView{
                    
                    view.frame.origin = CGPoint(x: 35 + j * 90, y: 120 + i * 220)
                    
                    view.tag = j
                    
                    if (i == 0){
                        view.numberBottomRight.text = blackjackManager.houseHand[j].rank
                        view.numberTopLeft.text = blackjackManager.houseHand[j].rank
                        view.rank = blackjackManager.houseHand[j].rank
                        view.suit = blackjackManager.houseHand[j].suit
                        
                        
                        houseViews.append(view)
                    }else if (i == 1){
                        view.numberBottomRight.text = blackjackManager.playerHand[j].rank
                        view.numberTopLeft.text = blackjackManager.playerHand[j].rank
                        view.rank = blackjackManager.playerHand[j].rank
                        view.suit = blackjackManager.playerHand[j].suit
                        view.onTapDelegate = self
                        playerViews.append(view)
                    }
                    
                    self.view.addSubview(view)
                }
            }
        }
    }
    
    
    /// getIndexPlayer retorna el index de la carta en la que se encuentra actualmente el jugador para poder utilzarlo en la view da la carta respectiva (viene de un Protocol)
    ///
    /// - Returns: Retorna un Int de index
    func getIndexPlayer() -> Int {
        return blackjackManager.playerIndex
    }
    
    
    /// disableViews se encarga de que las vistas ya no puedan ser interactuables con el jugador una vez que el juego se acaba
    func disableViews(){
        for i in 0...3{
            playerViews[i].isUserInteractionEnabled = false
        }
    }
    
    /// onTap es una funcion del protocolo onTapDelegate y sirve para poder notificar al Controller cuando se ejecuta un gesture de tipo Tap, haciendo referencia al turno de un jugador
    ///
    /// - Parameter sender: UITapGestureRecognizer
    func onTap(_ sender: UITapGestureRecognizer){
        if let tag = sender.view?.tag {
            blackjackManager.showCard(cardTag: tag)
            
            if (blackjackManager.youWin){
                blackjackLabel.text = "Ganaste!"
                buttonStay.isEnabled = false
                disableViews()
            }
            if (blackjackManager.youLose){
                blackjackLabel.text = "Perdiste!"
                buttonStay.isEnabled = false
                disableViews()
            }
        }
    }
    
    
    /// stayTapped es una accion de buttonStay, y ejecutara las jugadas de la maquina/casa del blackjack, deshabilitando al jugador y obteniendo el valor final del total de cartas que puede tomar la casa.
    ///
    /// - Parameter sender: UIButton, boton que lo ejecuta
    @IBAction func stayTapped(_ sender: UIButton) {
        disableViews()
        
        finalValuePlayer = blackjackManager.playerValue
        var i = 0
        
        while (finalValueMachine < 17 && i < 4) {
            
            finalValueMachine = finalValueMachine + blackjackManager.machinePlay(position: i)
            
            houseViews[i].show()
            
            i += 1
            
            if (finalValueMachine > 21){
                blackjackLabel.text = "La casa paso de 21. Ganaste!"
                buttonStay.isEnabled = false
                return
            }
        }
        checkWinner()
    }
    
    
    /// resetTapped es una accion del boton resetButton, y se encarga de reiniciar todos los valores del juego a su estado inicial para comenzar una nueva partida.
    ///
    /// - Parameter sender: UIButton, el boton que lo ejecuta
    @IBAction func resetTapped(_ sender: UIButton) {
        
        playerViews.removeAll()
        
        houseViews.removeAll()
        
        for view in houseViews {
            view.removeFromSuperview()
        }
        
        for view in playerViews {
            view.removeFromSuperview()
        }
        
        buttonStay.isEnabled = true
        
        finalValueMachine = 0
        
        finalValuePlayer = 0
        
        blackjackManager.reset()
        
        blackjackManager.initializeCards()
        
        initGrid()
        
        blackjackLabel.text = "Blackjack"
    }
    
    
    /// checkWinner es una funcion que se encarga de calcular los resultados finales del jugador y la casa y anuncia el ganador final.
    func checkWinner(){
        if finalValuePlayer < finalValueMachine  {
            blackjackLabel.text = "Tienes menos que la casa. Perdiste!"
        }else if (finalValuePlayer > finalValueMachine){
            blackjackLabel.text = "Tienes más que la casa. Ganaste!"
        }else if (finalValuePlayer == finalValueMachine){
            blackjackLabel.text = "Fue un empate!"
        }
        
        buttonStay.isEnabled = false
    }
}
