//
//  LoginViewController.swift
//  Ulima_Games
//
//  Created by Eros Campos on 11/05/18.
//  Copyright © 2018 Eros Campos. All rights reserved.
//
import Foundation
import UIKit

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //TODO: Animate Label
    @IBOutlet weak var TextField: UITextField!
    
    @IBAction func loginTapped(_ sender: UIButton) {
        let vcd = storyboard?.instantiateViewController(withIdentifier: "MainTabViewController") as! MainTabViewController
        
        if (TextField.text?.isEmpty)! {
            let alert = UIAlertController(title: "Alerta", message: "Debe ingresar un nombre", preferredStyle: UIAlertControllerStyle.alert)
            
            alert.addAction(UIAlertAction(title: NSLocalizedString("OK", comment: "Default action"), style: .default, handler: {_ in
                NSLog("The \"OK\" alert occured.")}))
            
            self.present(alert, animated: true, completion: nil)
        }else{
            vcd.playerName = TextField.text!
            present(vcd, animated: true, completion: nil)
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
