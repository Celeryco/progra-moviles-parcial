//
//  MichiViewController.swift
//  Ulima_Games
//
//  Created by Eros Campos on 16/05/18.
//  Copyright © 2018 Eros Campos. All rights reserved.
//

import UIKit

class MichiViewController: UIViewController {
    //Definicion de variables
    var michiManager: MichiManager
    var contador: Int{
        didSet{
            labMensaje.lineBreakMode = NSLineBreakMode.byWordWrapping
            labMensaje.numberOfLines = 2
            labMensaje.text = "Número de intentos: \(contador)"
        }
    }
    
    @IBOutlet var butCasillas: [UIButton]!
    
    @IBOutlet weak var labMensaje: UILabel!
    
    //Inicializacion de variables
    required init?(coder aDecoder: NSCoder) {
        self.michiManager = MichiManager()
        self.contador = 0
        super.init(coder: aDecoder)
    }
    
    //Inicializacion de los botones
    override func viewDidLoad() {
        for boton in butCasillas{
            boton.backgroundColor = michiManager.themeApp.background
            boton.setTitle(String(michiManager.themeApp.blockSymbol), for: UIControlState.normal)
        }
    }
    
    //Metodo para verificar casillas
    @IBAction func seleccionarCasiilla(_ sender: UIButton) {
        contador += 1
        
        if let indiceSeleccionado = butCasillas.index(of: sender){
            let boo = michiManager.realizarJugada(posicion: indiceSeleccionado)
            refrescarTablero()
            if boo{
                butCasillas.forEach{
                    buton in buton.isEnabled = false
                }
                
                labMensaje.text = "Ganó el jugador \(michiManager.jugadorActual.turno)"
            }
        }
    }
    
    //Meotdo para reiniciar casillas
    @IBAction func reset(_ sender: UIButton) {
        contador = 0
        michiManager.vaciar()
        for boton in butCasillas{
            boton.isEnabled = true
            boton.backgroundColor = michiManager.themeApp.background
            boton.setTitle(String(michiManager.themeApp.blockSymbol), for: UIControlState.normal)
        }
    }
    
    //Metodo para actualizar casillas
    func refrescarTablero(){
        for i in 0..<butCasillas.count{
            if michiManager.tablero[i]! != michiManager.themeApp.blockSymbol{
                voltearCasilla(casilla: butCasillas[i], jugador: michiManager.tablero[i]!)
            }
        }
    }
    func voltearCasilla(casilla boton: UIButton, jugador: Character){
        boton.setTitle(String(jugador), for: UIControlState.normal)
    }
}
