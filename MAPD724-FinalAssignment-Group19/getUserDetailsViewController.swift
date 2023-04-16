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
        self.title = "User Details"
        //getData()
        
        //dataTableView.reloadData()
        //nav.first

        
        toDoArrayDic.append(["User": "First Name", "Details":"Murtaza"])
        toDoArrayDic.append(["User": "Last Name", "Details": "Haider"])
        toDoArrayDic.append(["User": "Email", "Details": "murtaza@gmail.com"])
        toDoArrayDic.append(["User": "Phone", "Details": "4372568766"])
        toDoArrayDic.append(["User": "Password", "Details": "Aman@0726"])
        
        
//        func getData(){
//            let db = Firestore.firestore()
//            db.collection("users").addSnapshotListener { (QuerySnapshot, error) in
//                guard let documents = QuerySnapshot?.documents else{
//                    print("no documents")
//                    return
//                }
//                print(documents)
//                self.toDoArray = documents.map{ (QueryDocumentSnapshot) -> userDataDef in
//                    let data = QueryDocumentSnapshot.data()
//                    let firstName = data["firstName"] as? String ?? ""
//                    let LastName = data["LastName"] as? String ?? ""
//                    let email = data["email"] as? String ?? ""
//                    let phone = data["phone"] as? String ?? ""
//                    let password = data["password"] as? String ?? ""
//                    print(firstName + LastName)
//                    return userDataDef(firstName: firstName, LastName: LastName, phone: phone, password: password, email: email)
//
//                }
//                let indexPath = IndexPath(row: self.toDoArray.count-1, section: 0)
//                print(indexPath)
//                self.dataTableView.insertRows(at: [indexPath], with: .automatic)
//            }
//        }
        
        
        
        
        
        
        
        
//        let collectionRef = db.collection("NShWiW_-fUExry5KdS3")
//        collectionRef.getDocuments { (querySnapshot, error) in
//            if let error = error {
//                print("Error getting documents: \(error)")
//            } else {
//                for document in querySnapshot!.documents {
//                    let data = document.data()
//                    if let firstname = data["firstName"] as? String, let Lastname = data["LastName"] as? String, let email = data["email"] as? String, let phone = data["phone"] as? String, let password = data["password"] as? String{
//                        let newData = userDataDef(firstName: firstname, LastName: Lastname, phone: phone, password: password, email: email)
//                        self.toDoArray.append(newData)
//                    }
//                    // Do something with the data, like adding it to an array
//                }
//            }
//        }
        
        
        
        
        
        
        
        
        
        
        //        getDataFromDB()
        //    }
        //    func getDataFromDB(){
        //
        //        let doc = database.document("users/userDetails")
        //
        //        doc.getDocument {[self] snapshot, error in
        //            guard let data = snapshot?.data() as? [String: Any], error == nil else{return}
        //            if let firstname = data["firstName"] as? String, let Lastname = data["LastName"] as? String, let email = data["email"] as? String, let phone = data["phone"] as? String, let password = data["password"] as? String{
        //                let dataUser = userDataDef(firstName: firstname, LastName: Lastname, phone: phone, password: password, email: email)
        //                print(dataUser.firstName)
        //                toDoArray.append(dataUser)
        //            }
        //        }
        //    }
    }}
    extension getUserDetailsViewController: UITableViewDelegate, UITableViewDataSource{
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            print(toDoArray.count)
            return toDoArrayDic.count
    
        }
    
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            let cellDC = dataTableView.dequeueReusableCell(withIdentifier: "newCell", for: indexPath)
            
//            toDoArrayDic.append(["User": "First Name", "Details": toDoArray[indexPath.row].firstName])
//            toDoArrayDic.append(["User": "Last Name", "Details": toDoArray[indexPath.row].LastName])
//            toDoArrayDic.append(["User": "Email", "Details": toDoArray[indexPath.row].email])
//            toDoArrayDic.append(["User": "Phone", "Details": toDoArray[indexPath.row].phone])
//            toDoArrayDic.append(["User": "Password", "Details": toDoArray[indexPath.row].password])
//            toDoArrayDic.append(["User": "Murtaza", "Details": "QA"])
            cellDC.detailTextLabel?.font = .systemFont(ofSize: 12)
            
            cellDC.textLabel?.font = .systemFont(ofSize: 15)
            cellDC.textLabel?.text = toDoArrayDic[indexPath.row]["User"] as? String
            cellDC.detailTextLabel?.text = toDoArrayDic[indexPath.row]["Details"] as? String
            
            return cellDC
            
        }
        
    }
    
    
    
    
    //    @IBAction func logoutBtnAction(_ sender: UIButton) {
    //        let auth = Auth.auth()
    //
    //        do{
    //            try auth.signOut()
    //            let userPageVC = self.storyboard?.instantiateViewController(withIdentifier: "signInfoVC") as! signInfoViewController
    //            self.navigationController?.pushViewController(userPageVC, animated: true)
    //            print("user is logged out successfully")
    //        }catch {
    //            print("Error in signOut")
    //        }
    //
    //    }
    
    
    //            let colors = Array(data.values)
    //            print(colors)
    //            guard let text: String = data["password"] as? String else{
    //                return
    //            }
    


