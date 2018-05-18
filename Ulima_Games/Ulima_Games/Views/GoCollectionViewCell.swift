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
    func getTotalTaps() -> Int
    func updateTable(position_x: Int, position_y:Int)
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
            let taps = delegate.getTotalTaps()
            if (taps == 80){
                
            }else{
                let playerIcon = delegate.getIconPlayer()
                
                if (!played) {
                    print("Row: \(row) Column: \(column)" )
                    show(icon: playerIcon)
                    
                    delegate.updateTable(position_x: row, position_y: column)
                    
                    delegate.onTap(gestureRecognizer as! UITapGestureRecognizer)
                }
            }
        }
    }
    
    func show(icon: String){
        self.bringSubview(toFront: ficha)
        
        ficha.text = icon
        
        UIView.animate(withDuration: 0.5, animations: {
            self.ficha.alpha = 1
        })
        
        played = true
    }
}
