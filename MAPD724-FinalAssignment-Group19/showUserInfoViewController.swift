//
//  showUserInfoViewController.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-11.
//

import UIKit
import FirebaseAuth
import Firebase

class showUserInfoViewController: UIViewController {
    
    
    @IBOutlet var userDetailTableView: UITableView!
    
    var ref = DatabaseReference.init()
    
    var arrData = [userDetailModel]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.getAllData()
        
    }
    
    func getAllData(){
        let userID : String = (Auth.auth().currentUser?.uid)!
            print("Current user ID for func getAllData is : " + userID)

        self.ref.child("userDetails").child(userID).observeSingleEvent(of: .value, with: {(snapshot) in
               
               if !snapshot.exists() { return }

                       print(snapshot) // Its print all values including Snap (User)

                       print(snapshot.value!)

                       let username = snapshot.childSnapshot(forPath: "firstName").value
                       print(username!)
//               self.arrData.removeAll()
//               if let snapShot = snapshot.children.allObjects as? [DataSnapshot]{
//                   print(snapShot)
//                   for snap in snapShot {
//                       if let mainDict = snap.value as? [String: AnyObject]{
//                           let firstName = mainDict["firstName"] as? String
//                           let LastName = mainDict["LastName"] as? String
//                           let phone = mainDict["phone"] as? String
//                           let email = mainDict["email"] as? String
//                           let password = mainDict["password"] as? String
//                           self.arrData.append(userDetailModel(firstName: firstName!, LastName: LastName!, email: email!, phone: phone!, password: password!))
//                           self.userDetailTableView.reloadData()
//
//                       }
//                   }
//               }

                let userEmail = (snapshot.value as! NSDictionary)["addedByUser"] as! String
                print(userEmail)


            })
    }

}
extension showUserInfoViewController: UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! userDetailTableViewCell
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrData.count
    }
    
}
