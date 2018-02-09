//
//  TweetCell.swift
//  Twitter
//
//  Created by Apple on 2/8/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewsConstraints()
    }
    
    private func setViewsConstraints(){
        addSubViewsInsideMainViews()
        setTweetLabelConstraints(label: tweetLabel)
        setImageConstraints(image: imageView)
        setUsernameLabelConstraints(label: usernameLabel)
        setBioTextViewConstraints(text: bioTextView)
        setFollowButtonConstraints(button: followButton)
    }
    
    private func addSubViewsInsideMainViews(){
        addSubview(imageView)
        addSubview(tweetLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
    }
    
    private let imageView : UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.backgroundColor = .red
        return image
    }()
    
    private let tweetLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Some Text"
        label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "username"
        label.backgroundColor = UIColor.yellow
        return label
    }()
    
    private let bioTextView : UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.text = "bio\nText\nNew Text"
        text.backgroundColor = UIColor.green
        return text
    }()
    
    private let followButton : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Follow", for: .normal)
        button.backgroundColor = .brown
        return button
    }()
    
    private func setImageConstraints(image : UIImageView){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setTweetLabelConstraints(label : UILabel){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            label.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -12),
            label.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    private func setUsernameLabelConstraints(label : UILabel){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: tweetLabel.bottomAnchor, constant: 12),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            label.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -12),
            label.heightAnchor.constraint(equalToConstant: 30)
            ])
    }
    
    private func setBioTextViewConstraints(text : UITextView){
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 12),
            text.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 12),
            text.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            text.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -12)
        ])
    }
    
    private func setFollowButtonConstraints(button : UIButton){
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 60),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -12),
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            button.widthAnchor.constraint(equalToConstant: 110)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
