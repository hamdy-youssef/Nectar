//
//  LoginVC.swift
//  Nectar
//
//  Created by Hamdy Youssef on 26/10/2023.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var seenPassword: UIButton!
    
    let user = UserDefaultsManager.shared () .loadUserData()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    func isValidEmail(email: String) -> Bool {
        if !email.trimm.isEmpty {
            print("email")
            if ValidationManager.shared().isValidEmail(email: email) {
                print("not valid")
                showAlert (title: "Sorry", messege: "please enter valid email!")
                return false
            }
            return true
        } else {
            print(" valid")
            showAlert(title: "Sorry", messege: "the email is required!")
            return false
        }
    }
    
    func validateFields () -> Bool {
        if let email = emailTextField.text, isValidEmail(email: email){
            return true
            
        }
    return false
    }
    
    func isValidatCredentials () -> Bool {
        if let email = emailTextField.text, !email.trimm.isEmpty, emailTextField.text == user?.email, let
            password = passwordTextField.text, !password.trimm.isEmpty, password ==
            user?.password {
            return true
            
        }
        return false
    }

    @IBAction func seenPasswordAction(_ sender: Any) {
        if passwordTextField.isSecureTextEntry{
            seenPassword.setImage(UIImage(systemName: "eyes.inverse"), for: .normal)
            passwordTextField.isSecureTextEntry = false
        }else {
            seenPassword.setImage(UIImage(systemName: "eyes"), for: .normal)
            passwordTextField.isSecureTextEntry = true
        }
    }
    @IBAction func logInAction(_ sender: Any) {
        if isValidatCredentials () {
            showAlert(title: "Succese", messege: "Welcome Back \((user?.name)!)")
            emailTextField.text = ""
            passwordTextField.text = ""
        } else {
            showAlert(title: "Sorry", messege: "please enter valid credentials!")
        }
    }
    
    @IBAction func signUpAction(_ sender: Any) {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let signup = sb.instantiateViewController(withIdentifier: "SignUpVC") as! SignUpVC
        self.present (signup, animated: true)
    }
}
