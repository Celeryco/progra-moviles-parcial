//
//  BlackjackCardView.swift
//  Ulima_Games
//
//  Created by Eros Campos on 16/05/18.
//  Copyright © 2018 Eros Campos. All rights reserved.
//
import UIKit

import Foundation

protocol onTapDelegate{
    func onTap(_ sender: UITapGestureRecognizer)
    func getIndexPlayer() -> Int
}

class CardView: UIView {
    
    
    var rank: String
    
    var suit: String
    
    @IBOutlet weak var numberTopLeft: UILabel!

    @IBOutlet weak var numberCenter: UILabel!
    
    @IBOutlet weak var numberBottomRight: UILabel!
    
    
    var isFacedUp: Bool = false
    
    var isEnabled: Bool = false
    
    var onTapDelegate: onTapDelegate?
    
    /// Para poder agregar gestures
    ///
    /// - Parameter aDecoder: Default
    required init?(coder aDecoder: NSCoder) {
        self.rank = ""
        self.suit = ""
        
        super.init(coder: aDecoder)
        
        let tapRecognizer: UIGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(onTap(_:)))
        addGestureRecognizer(tapRecognizer)
    }
    
    
    /// Funcion para poder ser delegada en la clase BlackjackController y utilizar TapGestures
    ///
    /// - Parameter gestureRecognizer: TapGestureRecognizer
    @objc private func onTap(_ gestureRecognizer : UIGestureRecognizer){
        if let delegate = onTapDelegate{
            
            let index = delegate.getIndexPlayer()
            
            if (!isFacedUp && self.tag == index) {
                show()
                delegate.onTap(gestureRecognizer as! UITapGestureRecognizer)
            }
        }
    }
    
    /// Funcion que inicalmente oculta los valores de las ViewCards
    ///
    /// - Parameter rect: CGRect
    override func draw(_ rect: CGRect) {
        numberTopLeft?.alpha = 0
        numberBottomRight?.alpha = 0
    }
    
    /// show() muestra los valores de las cartas que son jugadas
    func show(){
        numberTopLeft.alpha = 1
        numberBottomRight.alpha = 1
        numberCenter.font.withSize(15)
        numberCenter.text = "\(rank)\(suit)"
        isFacedUp = true
    }
}
