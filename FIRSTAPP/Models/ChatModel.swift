//
//  ChatModel.swift
//  FIRSTAPP
//
//  Created by Imesh Madusanka on 2023-03-07.
//

import Foundation


struct ChatModel : Identifiable {
    var id  = UUID()
    var userId : Int32
    var message : String
    var messageTime : Date
    
    init(userId: Int32, message: String, messageTime: Date) {
        self.userId = userId
        self.message = message
        self.messageTime = messageTime
    }
    
    
}
