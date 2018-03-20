//
//  UserService.swift
//  Twitter
//
//  Created by Apple on 3/13/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import TRON
import SwiftyJSON

class UserService : WebService, JSONDecodable {
    
    var users = [User]()
    
    required init(json: JSON) throws {
        print("parsing JSON \n")
        if let usersList = json["users"].array {
            for user in usersList {
                let object = User(id : user["id"].intValue, name: user["name"].stringValue, user: user["username"].stringValue, image: user["profileImageUrl"].stringValue, bio : user["bio"].stringValue)
                self.users.append(object)
            }
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("in json error")
        }
    }
}
