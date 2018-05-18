//
//  GoViewController.swift
//  Ulima_Games
//
//  Created by Josue on 16/05/18.
//  Copyright © 2018 Josue. All rights reserved.
//

import UIKit

class GoViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate, goOnTapDelegate {
    
    
    @IBOutlet var collectionView: UICollectionView!
    
    @IBOutlet var labelNegras: UILabel!
    
    @IBOutlet var labelBlancas: UILabel!
    
    var goManager: GoManager
    
    var taps: Int
    
    //Inicializacion de variables
    required init?(coder aDecoder: NSCoder) {
        self.goManager = GoManager()
        self.taps = 0
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 9
    }
    
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 9
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ficha", for: indexPath) as? GoCollectionViewCell
        
        cell?.column = indexPath.section
        
        cell?.row = indexPath.row
        
        cell?.goOnTapDelegate = self
        
        // Configure the cell
        return cell!
    }
    
    func getTotalTaps() -> Int {
        print(taps)
        return taps
    }
    
    func getIconPlayer() -> String {
        let icon = goManager.player.simbolo
        return icon
    }
    
    func updateTable(position_x: Int, position_y: Int) {
        goManager.updateTable(x: position_x, y: position_y)
        
        goManager.calculatePoints(x: 0, y: 0, color: goManager.player.turno, arreglo: goManager.arreglito)
        
        print(goManager.arreglito)
    }
    
    func onTap(_ sender: UITapGestureRecognizer) {
        taps += 1
        changePlayer()
    }

    func changePlayer(){
        if goManager.player.turno == 1 {
            goManager.player.turno = 2
            goManager.player.simbolo = goManager.allStones[1]
        }else{
            goManager.player.turno = 1
            goManager.player.simbolo = goManager.allStones[0]
        }
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */
}
