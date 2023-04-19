//
//  SocketioHelper.swift
//  FIRSTAPP
//
//  Created by Chathura Jayasekara on 2023-03-07.
//

import Foundation
import SocketIO



struct SocketioHelper {
    var socket :SocketIOClient
    let dateFormatter = DateFormatter()
    
    let manager = SocketManager(socketURL: URL(string: "http://localhost:5001")!/*, config: [.log(true), .compress]*/)
    
    init() {
        socket = manager.defaultSocket
        dateFormatter.dateFormat = "yyyy-MM-dd"
    }
    
    
    func socketOn(callBack: @escaping(ChatModel) -> () ) -> Void {
        socket.connect()
        socket.on("new_user") {data, ack in
            let chat = data[0] as? [String: Any]
            
            callBack(ChatModel(userId: Int32(chat!["user_id"] as! Int32), message: chat?["message"] as! String, messageTime:(dateFormatter.date(from: chat!["date"] as! String) ?? dateFormatter.date(from:  "2022-02-05"))!))
        }
    }

    func emit() -> Void {
        socket.on("currentAmount") {data, ack in
            guard let cur = data[0] as? Double else { return }
            
            socket.emitWithAck("canUpdate", cur).timingOut(after: 0) {data in
                if data.first as? String ?? "passed" == SocketAckStatus.noAck {
                    // Handle ack timeout
                }
                socket.emit("update", ["amount": cur + 2.50])
            }
            ack.with("Got your currentAmount", "dude")
        }
    }
    
    func connectSocket() -> Void{
        socket.connect()
    }

}
