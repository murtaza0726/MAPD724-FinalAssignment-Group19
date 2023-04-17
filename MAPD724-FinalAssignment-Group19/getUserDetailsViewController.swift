//
//  getUserDetailsViewController.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-12.
//

import UIKit
import FirebaseFirestore
import Firebase

class getUserDetailsViewController: UIViewController {
    
    @IBOutlet weak var dataTableView: UITableView!{
        didSet{
            dataTableView.dataSource = self
        }
    }
    
    let database = Firestore.firestore()
    
    var toDoArray = [userDataDef]()

    var toDoArrayDic = [[String: Any]]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.title = "User Details"
        logout()

        toDoArrayDic.append(["User": "First Name", "Details":"Murtaza"])
        toDoArrayDic.append(["User": "Last Name", "Details": "Haider"])
        toDoArrayDic.append(["User": "Email", "Details": "murtaza@gmail.com"])
        toDoArrayDic.append(["User": "Phone", "Details": "4372568766"])
        toDoArrayDic.append(["User": "Password", "Details": "Aman@0726"])
    }
    func logout(){
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Sign Out", style: .done, target: self, action: #selector(log))
    }
    @objc func log(){
        let auth = Auth.auth()
        do{
            try auth.signOut()
            let userPageVC = self.storyboard?.instantiateViewController(withIdentifier: "signInfoVC") as!
            signInfoViewController
            self.navigationController?.pushViewController(userPageVC, animated: true)
            print("user is logged out successfully")
            
        }catch
        {
            print("Error in signOut")
        }
    }
    
}
    extension getUserDetailsViewController: UITableViewDelegate, UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print(toDoArray.count)
            return toDoArrayDic.count
    
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cellDC = dataTableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath)
            cellDC.detailTextLabel?.font = .systemFont(ofSize: 12)
            
            cellDC.textLabel?.font = .systemFont(ofSize: 15)
            cellDC.textLabel?.text = toDoArrayDic[indexPath.row]["User"] as? String
            cellDC.detailTextLabel?.text = toDoArrayDic[indexPath.row]["Details"] as? String
            
            return cellDC
            
        }
        
    }
