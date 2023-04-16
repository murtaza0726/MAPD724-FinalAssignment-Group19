//
//  signUpViewController.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-09.
//

import UIKit
import Firebase
import FirebaseAuth
import FirebaseFirestore

class signUpViewController: UIViewController {
    
    @IBOutlet var fNameText: UITextField!
    @IBOutlet var LastNameText: UITextField!
    @IBOutlet var phoneNumText: UITextField!
    @IBOutlet var emailText: UITextField!
    @IBOutlet var passwordText: UITextField!
    
    
    @IBOutlet var invalidFirstName: UILabel!
    @IBOutlet var invalidLastName: UILabel!
    @IBOutlet var invalidPhoneNum: UILabel!
    @IBOutlet var invalidPassword: UILabel!
    @IBOutlet var invalidEmailMsg: UILabel!
    
    //firestore
    var database = Firestore.firestore()
    
    //database reference
    var ref = DatabaseReference.init()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        invalidEmailMsg.isEnabled = false
        invalidPassword.isEnabled = false
        invalidPhoneNum.isEnabled = false
        invalidLastName.isEnabled = false
        invalidFirstName.isEnabled = false
        
        //padding for text field
        fNameText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailText.frame.height))
        fNameText.layer.cornerRadius = 10
        fNameText.leftViewMode = .always
        
        LastNameText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: LastNameText.frame.height))
        LastNameText.layer.cornerRadius = 10
        LastNameText.leftViewMode = .always
        
        phoneNumText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailText.frame.height))
        phoneNumText.layer.cornerRadius = 10
        phoneNumText.leftViewMode = .always
        
        emailText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: LastNameText.frame.height))
        emailText.layer.cornerRadius = 10
        emailText.leftViewMode = .always
        
        passwordText.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: emailText.frame.height))
        passwordText.layer.cornerRadius = 10
        passwordText.leftViewMode = .always
        
        self.ref = Database.database().reference()
        
    }
    
    //button to sign up
    @IBAction func signUpBtn(_ sender: UIButton) {
        self.emailValidate()
        self.phoneValidate()
        self.passValidate()
        self.validFirstName()
        self.validLastName()
        self.createUserfunc()
        //self.saveData(
        self.btnTapped()
    }
    
    func btnTapped(){
            let text1 = fNameText.text
            let text2 = LastNameText.text
            let text3 = phoneNumText.text
            let text4 = emailText.text
            let text5 = passwordText.text
            if(text1 != nil && text2 != nil && text3 != nil && text4 != nil && text5 != nil){
                saveData(firstName: text1 ?? "", LastName: text2 ?? "", phone: text3 ?? "", password: text5 ?? "", email: text4 ?? "")
            }
    }
    
    func saveData(firstName: String, LastName: String, phone: String, password: String, email: String){
        let docRef = database.document("users/userDetails")
        docRef.setData(["firstName" : firstName, "LastName": LastName, "phone": phone, "email": email, "password" : password])
    }
//    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
//        let text1 = fNameText.text
//        let text2 = LastNameText.text
//        let text3 = phoneNumText.text
//        let text4 = emailText.text
//        let text5 = passwordText.text
//        if(text1 != nil && text2 != nil && text3 != nil && text4 != nil && text5 != nil){
//            saveData(firstName: text1 ?? "", LastName: text2 ?? "", phone: text3 ?? "", password: text4 ?? "", email: text5 ?? "")
//
//        }
//        return true
//    }
    
    //function to save user info to database
    
    //func saveData(){
    //func saveData(text1: String, text2: String, text3: String, text4: String, text5: String){
        //firestore
//        writeData(firstName: text1, LastName: text2, phone: text3, password: text4, email: text5)
        
        //real time firebas database
//        let dict = ["firstName":fNameText.text!, "LastName":LastNameText.text!, "phone":phoneNumText.text!, "email":emailText.text!, "password":passwordText.text!]
//        self.ref.child("userDetails").childByAutoId().setValue(dict)
    //}
    
    //function to ccreate user for login
    
    func createUserfunc(){
        Auth.auth().createUser(withEmail: emailText.text ?? "", password: passwordText.text ?? "") { firebaseResult, error in
            if let e = error {
                print(e.localizedDescription)
                print("not working")
            }else{
//                self.tabBarController?.selectedIndex = 0
                //navigate to app home page
//                let homePageVC = self.storyboard?.instantiateViewController(withIdentifier: "mapVC") as! ViewController
                self.navigationController?.popToRootViewController(animated: true)
//                //self.navigationController?.pushViewController(homePageVC, animated: true)
            }
        }
    }
    //function to validate email address field
    func emailValidate(){
        if (emailText.text?.isValidEmail)!{
            print("your email is valid")
        }
        else{
            print("email is invalid")
            invalidEmailMsg.isEnabled = true
            invalidEmailMsg.text = "Invalid email !!"
            invalidEmailMsg.textColor = UIColor.red
        }
    }
    
    //function to validate phone number field
    func phoneValidate(){
        if (phoneNumText.text?.isValidPhoneNumber)!{
            print("your phone number is valid")
        }else{
            print("phone is invalid")
            invalidPhoneNum.isEnabled = true
            invalidPhoneNum.text = "Invalid phone number !!"
            invalidPhoneNum.textColor = UIColor.red
        }
    }
    
    //function to validate password field
    func passValidate(){
        if (passwordText.text?.isValidPassword)!{
            print("your password is valid")
        }else{
            print("password is invalid")
            invalidPassword.isEnabled = true
            invalidPassword.text = "Invalid password!!"
            invalidPassword.textColor = UIColor.red
        }
    }
    func validFirstName(){
        if(fNameText.text?.isEmpty)!{
            self.invalidFirstName.isEnabled = true
            self.invalidFirstName.textColor = UIColor.red
            self.invalidFirstName.text = "Field can not be Empty"
        }
    }
    func validLastName(){
        if(LastNameText.text?.isEmpty)!{
            self.invalidLastName.isEnabled = true
            self.invalidLastName.textColor = UIColor.red
            self.invalidLastName.text = "PField can not be Empty"
        }
    }
}

//extension Regex to validate password, email, phone number
extension String{
    var isValidEmail: Bool{
        let emailRegex = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,3}"
        let emailTest = NSPredicate(format: "SELF MATCHES %@", emailRegex)
        return emailTest.evaluate(with: self)
    }
    var isValidPhoneNumber: Bool{
        let phoneRegex = "[0-9]{10}"
        let phoneTest = NSPredicate(format: "SELF MATCHES %@", phoneRegex)
        return phoneTest.evaluate(with: self)
    }
    var isValidPassword: Bool{
        let passRegex = "[A-Za-z0-9_@!#$%^&*_-]{8,}"
        let passTest = NSPredicate(format: "SELF MATCHES %@", passRegex)
        return passTest.evaluate(with: self)
    }
}

