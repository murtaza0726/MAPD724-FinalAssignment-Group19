//
//  userInfoViewController.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-10.
//

import UIKit
import FirebaseAuth
import Firebase

class userInfoViewController: UIViewController {

    
    @IBOutlet var logoutBtn: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    var ref = DatabaseReference.init()
    @IBAction func logoutBtnAction(_ sender: UIButton) {
        print("info button tapped")
        
        Auth.auth().addStateDidChangeListener { auth, user in
          if user != nil {
            // User is signed in. Show home screen
            let tabBarC = self.storyboard?.instantiateViewController(withIdentifier: "showUserInfo") as! getUserDetailsViewController
              self.navigationController?.pushViewController(tabBarC, animated: true)
              let userID : String = (Auth.auth().currentUser?.uid)!
                  print("Current user ID is : " + userID)
              print("user is logged in")
            print("User signed in, switched to TabBarController")
            
          } else {
            // No User is signed in. Show user the login screen
            let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "signInfoVC") as! signInfoViewController
            welcomeVC.modalPresentationStyle = .fullScreen
            self.present(welcomeVC, animated: false, completion: nil)
            print("No user signed in, switched to WelcomeViewController")
            
          }
        }
//        if Auth.auth().currentUser != nil {
//
//            let userPageVC = self.storyboard?.instantiateViewController(withIdentifier: "showUserInfo") as! getUserDetailsViewController
//            self.navigationController?.pushViewController(userPageVC, animated: true)
//            print("user is logged in")
//            let userID : String = (Auth.auth().currentUser?.uid)!
//                print("Current user ID is : " + userID)
//        }else{
//            let userPageVC = self.storyboard?.instantiateViewController(withIdentifier: "signInfoVC") as! signInfoViewController
//            self.navigationController?.pushViewController(userPageVC, animated: true)
//            print("user is not logged in")
//        }
    }
    
}
