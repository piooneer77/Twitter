//
//  Tweet.swift
//  Twitter
//
//  Created by Apple on 2/24/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import TRON
import SwiftyJSON

class Tweet : JSONDecodable {
    
    required init(json: JSON) throws {
        
    }
    
    var user : User?
    var tweet : String?
    
    init(user : User, tweet : String) {
        self.user = user
        self.tweet = tweet
    }
    
}
