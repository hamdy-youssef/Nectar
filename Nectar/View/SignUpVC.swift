//
//  SignUpVC.swift
//  Nectar
//
//  Created by Hamdy Youssef on 26/10/2023.
//

import UIKit

class SignUpVC: UIViewController {

    @IBOutlet var userNameTextField: UITextField!
    @IBOutlet var passwordTextField: UITextField!
    @IBOutlet var emailTextField: UITextField!
    @IBOutlet var seenPassword: UIButton!
    
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
    
    func isValidPassword(password: String) -> Bool {
        if !password.trimm.isEmpty {
            if !ValidationManager.shared().isValidPassword(password: password) {
                showAlert(title: "Sorry", messege: "the password should contains at least 6 characters")
                return false
            }
            return true
        }else {
            showAlert(title: "Sorry", messege: "the password is required!")
            return false
        }
    }
    
    
    func validateFields () -> Bool {
        if let email = emailTextField.text, isValidEmail(email: email), let password =
            passwordTextField.text, isValidPassword(password: password) {
            return true
            
        }
    return false
    }
    
    func saveUserData() {
        if validateFields (){
            guard let name = userNameTextField.text, let email = emailTextField.text, let password = passwordTextField.text else {return}
            let user = User(name: name, email: email, password: password)
            UserDefaultsManager.shared () .saveUserData(user: user)
            emailTextField.text = ""
            userNameTextField.text = ""
            passwordTextField.text = ""
        }
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
    @IBAction func signUpAction(_ sender: Any) {
        saveUserData()
        showAlert(title: "Succese", messege: "Signed Up!")
        
    }
    
    @IBAction func logInAction(_ sender: Any) {
        let sb = UIStoryboard (name: "Main", bundle: nil)
        let login = sb.instantiateViewController(withIdentifier: "LoginVC") as! LoginVC
        self.present (login, animated: true)
    }
}
