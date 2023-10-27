//
//  WelcomVC.swift
//  Nectar
//
//  Created by Hamdy Youssef on 26/10/2023.
//

import UIKit

class WelcomVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func getStartedAction(_ sender: Any) {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let login = sb.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.present (login, animated: true)
    }
    
}
