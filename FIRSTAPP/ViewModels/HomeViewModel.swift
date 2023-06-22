//
//  HomeViewModel.swift
//  FIRSTAPP
//
//  Created by Imesh Madusanka on 2023-03-02.
//

import Foundation
import Alamofire
import SwiftyJSON


class HomeViewModel : ObservableObject {
    @Published var users : UserModelToJson?
    //@State
    
    func fetchUserList() -> Void {
        print("call fetchUserList")
        AF.request("https://jsonplaceholder.typicode.com/users").responseData { data in
            switch (data.result){
                        case .success(let datawork):
                            let json =  JSON(datawork)
                            print(json)
                            self.users  = UserModelToJson(data: json)
                if (self.users!.listOfUsers.count) > 0 {
                                /*DispatchQueue.main.async {
                                    self.delegate?.reloadTblView()
                                }*/
                            }
                            
                        case .failure(_):
                            print(data.error ?? "")
                            
                        }
            
            
          }
    }
}

