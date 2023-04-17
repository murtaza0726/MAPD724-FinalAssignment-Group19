//
//  signInfoViewController.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-09.
//

import UIKit
import FirebaseAuth

class signInfoViewController: UIViewController {

    @IBOutlet var signInBtn: UIButton!
    @IBOutlet var signUpBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if Auth.auth().currentUser != nil {
            
            let userPageVC = self.storyboard?.instantiateViewController(withIdentifier: "userInfoVC") as! myTableViewController
            self.navigationController?.pushViewController(userPageVC, animated: true)
            print("user is logged in")
        }else{
            print("user is not logged in")
        }
    }

    @IBAction func signInAction(_ sender: UIButton) {
        let homePageVC = self.storyboard?.instantiateViewController(withIdentifier: "loginVC") as! signInViewController
        self.navigationController?.pushViewController(homePageVC, animated: true)
        print("btn pressed")
    }
    
    @IBAction func signUpAction(_ sender: UIButton) {
        let signUpPageVC = self.storyboard?.instantiateViewController(withIdentifier: "signUpViewController") as! signUpViewController

        self.navigationController?.pushViewController(signUpPageVC, animated: true)
        print("btn pressed")
    }
    
}
