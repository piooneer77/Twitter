//
//  User.swift
//  Twitter
//
//  Created by Apple on 2/10/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import TRON
import SwiftyJSON

class User : JSONDecodable {
    
    required init(json: JSON) throws {
        
    }
    
    var id : Int?
    var name : String?
    var user : String?
    var image : String?
    var bio : String?
    
    init (id: Int, name: String, user: String, image: String, bio : String) {
        self.name = name
        self.image = image
        self.bio = bio
        self.id = id
        self.user = user
    }
    
}

