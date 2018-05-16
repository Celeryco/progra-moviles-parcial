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
        let mainTabController = storyboard?.instantiateViewController(withIdentifier: "MainTabViewController") as! MainTabViewController
        
        if let name_text = TextField.text{
            mainTabController.jugador_nombre = name_text
        }else{
            let alert = UIAlertController(title: "Alerta", message: "Debe ingresar un nombre", preferredStyle: UIAlertControllerStyle.alert)

            alert.addAction(UIAlertAction(title: "Click", style: .default, handler: { action in switch action.style{
                    case .default
                }
            }))

            self.present(alert, animated: true, completion: nil)

        }

        present(mainTabController, animated: true, completion: nil)
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
