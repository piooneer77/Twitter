//
//  User.swift
//  Twitter
//
//  Created by Apple on 2/10/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class User {
    
    var name : String?
    var user : String?
    var tweet : String?
    var image : String?
    
    init (name: String, user: String, tweet: String, image: String) {
        self.name = name
        self.image = image
        self.tweet = tweet
        self.user = user
    }
    
}

