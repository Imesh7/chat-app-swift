//
//  User.swift
//  FIRSTAPP
//
//  Created by Chathura Jayasekara on 2023-03-02.
//

import Foundation
import SwiftyJSON

struct UserModel : Hashable{
    let id :  Int32
    let userName : String?
    let lastMessage : String?
    
    init(id: Int32, userName: String?, lastMessage: String?) {
        self.id = id
        self.userName = userName
        self.lastMessage = lastMessage
    }
    
    init(data : JSON) {
        self.id = data["id"].int32Value
        self.userName = data["name"].stringValue
        self.lastMessage = data["username"].stringValue
    }
}

struct UserModelToJson {
    var listOfUsers : [UserModel]
    
    init(data: JSON) {
        self.listOfUsers = data.arrayValue.map{
            (UserModel(data: $0))
        }
    }
}
