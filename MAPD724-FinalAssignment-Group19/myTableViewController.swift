//
//  myTableViewController.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-12.
//

import UIKit
import Firebase
import FirebaseAuth

class myTableViewController: UIViewController {

    @IBOutlet var mytableView: UITableView!
    
    var profilArrData = ["User Profile", "Notifications", "Location Services", "Country/Region", "Contact Us", "Help and Information", "Privacy Policy", "Setting", "Terms & Conditions"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Support"
    }
}
extension myTableViewController: UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profilArrData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = mytableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath)
        cell.textLabel?.text = profilArrData[indexPath.row]
        cell.textLabel?.font = UIFont.systemFont(ofSize: 16.0)
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("info button tapped")
        if indexPath.row == 0
        {
            check()
        }else{
            print("Welcome")
            let welcomeVC = self.storyboard?.instantiateViewController(withIdentifier: "nOK") as! NotInUserViewController
            self.navigationController?.pushViewController(welcomeVC, animated: true)
        }
    }
    
    func check(){
        if Auth.auth().currentUser?.uid != nil {
            Auth.auth().currentUser?.reload(completion: { (error) in
                        if let error = error {
                            print("checkIfUserSignedIn \(error.localizedDescription)")
                        }
                let userPageVC = self.storyboard?.instantiateViewController(withIdentifier: "showUserInfo") as! getUserDetailsViewController
                self.navigationController?.pushViewController(userPageVC, animated: true)
                print("user is logged in")
                let userID = (Auth.auth().currentUser?.uid) ?? ""
                    print("Current user ID is : " + userID)
                    })
        }else{
            let userPageVC = self.storyboard?.instantiateViewController(withIdentifier: "signInfoVC") as! signInfoViewController
            self.navigationController?.pushViewController(userPageVC, animated: true)
            print("user is not logged in")
        }
    }
}
