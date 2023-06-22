//
//  ChatViewModel.swift
//  FIRSTAPP
//
//  Created by Imesh Madusanka on 2023-03-02.
//

import Foundation


class ChatViewModel : ObservableObject {
    @Published var chatList : [ChatModel]
    var socket : SocketioHelper
    @State
    
    init() {
        self.chatList = []
        self.socket = SocketioHelper()
        print("viewmodel created 1")
        self.socket.socketOn { result in
            self.receiveMessage(aChatMessage: ChatModel(userId: result.userId, message: result.message, messageTime: result.messageTime))
                }
            }
    
    //when user send message
    func sendMessage(aChatMessage : ChatModel) -> Void {
        chatList.append(aChatMessage)
    }
    
    
    //when user receive message
    func receiveMessage(aChatMessage : ChatModel) -> [ChatModel] {
        chatList.append(aChatMessage)
       return chatList
    }
    
    
    
}
