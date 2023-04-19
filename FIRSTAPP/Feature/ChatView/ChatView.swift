//
//  File.swift
//  FIRSTAPP
//
//  Created by Chathura Jayasekara on 2023-03-02.
//

import Foundation
import SwiftUI

struct ChatView: View {
    @ObservedObject var viewmodel = ChatViewModel()
    
    var body: some View {
        AppBar()
        VStack(){
            HStack{
                if viewmodel.chatList.count != 0 {
                    List(viewmodel.chatList) { data in
                        Text(data.message)
                    }
                }
            }
            Spacer()
        }
        .navigationBarTitle("Chat View")
    }
}


struct AppBar: View {
    var body: some View {
        VStack(spacing: 10){
            HStack{
                Spacer()
            }.padding().padding(.trailing, 0)
        }.background(Color(.green).opacity(0.4))
    }
}
