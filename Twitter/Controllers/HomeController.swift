//
//  HomeController.swift
//  Twitter
//
//  Created by Apple on 2/8/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit
import TRON

class HomeController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let tron = TRON(baseURL: API.baseURL)
    
    var users : [User]?
    var tweets : [Tweet]?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(UserCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(TweetCell.self, forCellWithReuseIdentifier: "TweetCellId")
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
        collectionView?.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerId")
        collectionView?.backgroundColor = UIColor(red: 0.9, green: 0.9, blue: 0.93, alpha: 1)
        self.getHomeUsersDataFromAPI(completion: saveListOfUsers)
        self.getHomeTweetsDataFromAPI(completion: saveListOfTweets)
        print("passed viewdidload")
        setUpNavigationItems()
    }
    
    func saveListOfUsers(list : [User]) {
        self.users = list
        print("inside completion block")
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    func saveListOfTweets(list : [Tweet]) {
        self.tweets = list
        print("inside completion block")
        DispatchQueue.main.async {
            self.collectionView?.reloadData()
        }
    }
    
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 2
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if section == 0 {
            if let usersCount = users?.count{
                return usersCount
            } else {return 0}
        } else {
            if let tweetsCount = tweets?.count {
                return tweetsCount
            } else {return 0}
        }
        
//        guard let usersCount = users?.count else {return 0}
//        guard let tweetsCount = tweets?.count else {return 0}
//        return section == 0 ? usersCount : tweetsCount
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if indexPath.section == 0 {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! UserCell
            cell.user = users?[indexPath.item]
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "TweetCellId", for: indexPath) as! TweetCell
            cell.tweet = tweets?[indexPath.item]
            return cell
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        var height: CGFloat?
//        if let user = users?[indexPath.item] {
//        let size = CGSize(width: view.frame.width - 100 , height: 500)
//        let attributes = [NSAttributedStringKey.font: UIFont.systemFont(ofSize: 15)]
//        let estimatedFrame = NSString(string: (user.bio)!).boundingRect(with: size, options: .usesLineFragmentOrigin, attributes: attributes, context: nil)
//        height = estimatedFrame.height
//        }
        
        return CGSize(width: view.frame.width, height: 200)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath)
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerId", for: indexPath)
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        if section == 1 {
            return .zero
        }
        return CGSize(width: view.frame.width, height: 64)
    }

}
