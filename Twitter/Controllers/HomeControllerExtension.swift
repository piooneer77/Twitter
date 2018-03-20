//
//  HomeControllerExtention.swift
//  Twitter
//
//  Created by Apple on 2/12/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit
import TRON
import SwiftyJSON

extension HomeController {
    
    func getHomeTweetsDataFromAPI(completion : @escaping ([Tweet]) -> Void ){
        
        print("created TRON Object")
        
        let request : APIRequest<TweetService, JSONError> = self.tron.swiftyJSON.request(API.methodName)
        request.perform(withSuccess: { (tweetService) in
            print("success")
            print(tweetService.tweets.count)
            completion(tweetService.tweets)
        }) { (error) in
            print("failure\n", error)
        }
    }
    
    func getHomeUsersDataFromAPI(completion : @escaping ([User]) -> Void ){
        
        print("created TRON Object")
        
        let request : APIRequest<UserService, JSONError> = self.tron.swiftyJSON.request(API.methodName)
        request.perform(withSuccess: { (userService) in
            print("success")
            print(userService.users.count)
            completion(userService.users)
        }) { (error) in
            print("failure\n", error)
        }
    }
}

extension HomeController {
    
    func setUpNavigationItems(){
        setupLeftNavItem()
        setupRightNavItems()
        setupRemainingNavItems()
    }
    
    private func setupLeftNavItem(){
        let followButton = UIButton(type: .system)
        followButton.setImage(#imageLiteral(resourceName: "follow"), for: .normal)
        followButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        navigationItem.leftBarButtonItem = UIBarButtonItem(customView: followButton)
    }
    
    private func setupRightNavItems(){
        let searchButton = UIButton(type: .system)
        searchButton.setImage(#imageLiteral(resourceName: "search"), for: .normal)
        searchButton.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        let writeTweet = UIButton(type: .system)
        writeTweet.setImage(#imageLiteral(resourceName: "compose"), for: .normal)
        writeTweet.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        
        navigationItem.rightBarButtonItems = [UIBarButtonItem(customView: searchButton), UIBarButtonItem(customView: writeTweet)]
    }
    
    private func setupRemainingNavItems(){
        let twitterBadge = UIImageView(image: #imageLiteral(resourceName: "title_icon"))
        twitterBadge.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
        twitterBadge.contentMode = .scaleAspectFit
        navigationItem.titleView = twitterBadge
        
        navigationController?.navigationBar.isTranslucent = true
        navigationController?.navigationBar.backgroundColor = .white
        
    }
    
}
