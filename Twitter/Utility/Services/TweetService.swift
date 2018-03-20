//
//  TweetService.swift
//  Twitter
//
//  Created by Apple on 3/13/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import TRON
import SwiftyJSON

class TweetService : WebService, JSONDecodable {
    
    var tweets = [Tweet]()
    
    required init(json: JSON) throws {
        print("parsing JSON \n")
        if let tweetsList = json["tweets"].array {
            for tweet in tweetsList {
                let object = Tweet(user: User(id : tweet["user"]["id"].intValue, name: tweet["user"]["name"].stringValue, user: tweet["user"]["username"].stringValue, image: tweet["user"]["profileImageUrl"].stringValue, bio : tweet["user"]["bio"].stringValue), tweet: tweet["message"].stringValue)
                self.tweets.append(object)
            }
        }
    }
    
    class JSONError: JSONDecodable {
        required init(json: JSON) throws {
            print("in json error")
        }
    }
}
