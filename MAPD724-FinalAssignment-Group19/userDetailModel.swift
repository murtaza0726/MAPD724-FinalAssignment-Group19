//
//  userDetailModel.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-11.
//

import Foundation
import UIKit

class userDetailModel{
    
    let firstName: String
    let LastName: String
    let email:String
    let phone:String
    let password:String
    
    init(firstName: String, LastName: String, email: String, phone: String, password: String) {
        self.firstName = firstName
        self.LastName = LastName
        self.email = email
        self.phone = phone
        self.password = password
    }
}
