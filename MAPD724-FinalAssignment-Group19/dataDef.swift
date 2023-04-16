//
//  dataDef.swift
//  MAPD724-FinalAssignment-Group19
//
//  Created by Murtaza Haider Naqvi on 2023-04-13.
//

import Foundation

class userDataDef
{
    var firstName:String
    var LastName:String
    var phone:String
    var password: String
    var email: String
    
    init(firstName: String, LastName: String, phone:String, password:String, email:String) {
        self.firstName = firstName
        self.LastName = LastName
        self.phone = phone
        self.email = email
        self.password = password
    }
}

