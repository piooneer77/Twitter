//
//  HomeController.swift
//  Twitter
//
//  Created by Apple on 2/8/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class HomeController : UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    let users = [
        User(name: "Karim", user: "@piooneer77", tweet: "The company experienced rapid initial growth. It had 400,000 tweets posted per quarter in 2007. This grew to 100 million tweets posted per quarter in 2008", image:  "logo"),
        User(name: "Ahmed", user: "@Ahmed", tweet: "The company experienced rapid initial growth. It had 400,000 tweets posted per quarter in 2007. This grew to 100 million tweets posted per quarter in 2008", image:  "logo"),
        User(name: "Zian", user: "@Zain", tweet: "The company experienced rapid initial growth. It had 400,000 tweets posted per quarter in 2007. This grew to 100 million tweets posted per quarter in 2008", image:  "logo"),
        User(name: "Amro", user: "@Amro", tweet: "The company experienced rapid initial growth. It had 400,000 tweets posted per quarter in 2007. This grew to 100 million tweets posted per quarter in 2008", image:  "logo"),
        User(name: "Monica", user: "@monica", tweet: "The company experienced rapid initial growth. It had 400,000 tweets posted per quarter in 2007. This grew to 100 million tweets posted per quarter in 2008", image:  "logo"),
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView?.backgroundColor = .white
        collectionView?.register(TweetCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "headerId")
        collectionView?.register(FooterCell.self, forSupplementaryViewOfKind: UICollectionElementKindSectionFooter, withReuseIdentifier: "footerId")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return users.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! TweetCell
        cell.user = users[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: 150)
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionElementKindSectionHeader {
            let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "headerId", for: indexPath)
//            header.backgroundColor = .purple
            return header
        } else {
            let footer = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "footerId", for: indexPath)
//            footer.backgroundColor = .purple
            return footer
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForFooterInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 100)
    }

}
