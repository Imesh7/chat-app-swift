//
//  ContentView.swift
//  FIRSTAPP
//
//  Created by Chathura Jayasekara on 2023-02-28.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewmodel = HomeViewModel()
    @State private var isPlaying: Bool = false
    
    
    init() {
        viewmodel.fetchUserList()
    }
    
    var body: some View {
        NavigationView {
            VStack(){
                AppBar()
                HStack{
                    if viewmodel.users?.listOfUsers.count != 0 {
                        List(viewmodel.users?.listOfUsers ?? [], id:\.self) {data in
                            NavigationLink(destination: ChatView()) {
                                UserListTile(userModel: Binding<UserModel>.constant(data))
                            }
                        }
                    } else {
                        ProgressView().background(Color(UIColor.systemGray4))
                    }
                }
                Spacer()
            }
        }
    }
    
    
    struct AppBar: View {
        var body: some View {
            VStack(spacing: 20){
                HStack{
                    Text("Chat Screen")
                    Spacer()
                }.padding().padding(.trailing, 10)
            }.background(Color(.green).opacity(0.4))
        }
    }
    
    struct HomeView_Previews: PreviewProvider {
        static var previews: some View {
            HomeView()
            
        }
    }
}
