//
//  signInViewController.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-09.
//

import UIKit
import Firebase
import FirebaseAuth

class signInViewController: UIViewController {
    
    
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    @IBOutlet var invalidEmailText: UILabel!
    @IBOutlet var invalidPasswordText: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invalidEmailText.isEnabled = false
        invalidPasswordText.isEnabled = false
        
        //padding for text field
        emailText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordText.frame.height))
        emailText.layer.cornerRadius = 10
        emailText.leftViewMode = .always
        
        passwordText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: passwordText.frame.height))
        passwordText.layer.cornerRadius = 10
        passwordText.leftViewMode = .always
    }
    
    @IBAction func signInBtn(_ sender: UIButton) {
        signInUserfunc()
    }
    
    //function to sign in
    func signInUserfunc(){
        Auth.auth().signIn(withEmail: emailText.text ?? "", password: passwordText.text ?? "") { firebaseResult, error in
            if let e = error {
                print(e.localizedDescription)
                print("not working")
                self.invalidEmailText.text = "Please enter valid email"
                self.invalidPasswordText.text = "Please enter valid password"
                self.invalidEmailText.isEnabled = true
                self.invalidPasswordText.isEnabled = true
                self.invalidEmailText.textColor = UIColor.red
                self.invalidPasswordText.textColor = UIColor.red
                
            }else{
                self.navigationController?.popToRootViewController(animated: true)
            }
        }
    }
}

