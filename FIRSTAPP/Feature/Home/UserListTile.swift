//
//  UserListTile.swift
//  FIRSTAPP
//
//  Created by Chathura Jayasekara on 2023-03-02.
//

import Foundation
import SwiftUI
import URLImage

struct UserListTile : View{
   @Binding var userModel : UserModel
    
    var body : some View {
        
                HStack{
                    VStack(alignment: .leading){
                        HStack{
                            URLImage(URL(string: "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ7cMEr9HXbWjjGArjVcAbnfiUbbfIcSSM4EQ&usqp=CAU")!) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Circle())
                                    .overlay(Circle().stroke(Color.white, lineWidth: 1))
                                    .shadow(radius: 1)
                            }
                            .frame(width: 100, height: 100)
                            
                            Text(userModel.userName!)
                                .multilineTextAlignment(.leading)
                        }
                        HStack{
                            Spacer()
                            Text(userModel.lastMessage!).multilineTextAlignment(.leading)
                            Spacer()
                        }
                        
                    }.padding(.vertical, 10).padding(.horizontal, 10)
                    Spacer()
                }
           
    }
}
