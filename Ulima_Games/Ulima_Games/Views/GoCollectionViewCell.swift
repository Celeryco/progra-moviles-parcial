//
//  GoCollectionViewCell.swift
//  Ulima_Games
//
//  Created by Eros Campos on 16/05/18.
//  Copyright © 2018 Eros Campos. All rights reserved.
//

import UIKit

protocol goOnTapDelegate{
    func onTap(_ sender: UITapGestureRecognizer)
    func getIconPlayer() -> String
}

class GoCollectionViewCell: UICollectionViewCell, UIGestureRecognizerDelegate {
    
    @IBOutlet var ficha: UILabel!
    
    var played: Bool = false
    
    var row = 0
    
    var column = 0
    
    var goOnTapDelegate: goOnTapDelegate?
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.onTap(_:)))
        
        self.addGestureRecognizer(tap)
    }
    
    
    @objc private func onTap(_ gestureRecognizer : UIGestureRecognizer) {
        if let delegate = goOnTapDelegate{
            let playerIcon = delegate.getIconPlayer()
              if (!played) {
                print("Row: \(row) Column: \(column)" )
                show(icon: playerIcon)
                delegate.onTap(gestureRecognizer as! UITapGestureRecognizer)
              }
        }
    }
    
    /// show() muestra los valores de las cartas que son jugadas
    func show(icon: String){
        //TODO: FALTA ANIMACIONES
        self.bringSubview(toFront: ficha)
        ficha.text = icon
        played = true
    }
}
