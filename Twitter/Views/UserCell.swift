//
//  TweetCell.swift
//  Twitter
//
//  Created by Apple on 2/8/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class UserCell: UICollectionViewCell {
    
    let twitterColor = UIColor(displayP3Red: 0.33, green: 0.6, blue: 0.92, alpha: 1.0)
    
    var user: User? {
        didSet {
            guard let unwrappedUser = user else { return }
            
            imageView.image = UIImage(named: unwrappedUser.image!)
            usernameLabel.text = unwrappedUser.user
            tweetLabel.text = unwrappedUser.name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViewsConstraints()
    }
    
    private func setViewsConstraints(){
        addSubViewsInsideMainViews()
        setTweetLabelConstraints(label: tweetLabel)
        setImageConstraints(image: imageView)
        setUsernameLabelConstraints(label: usernameLabel)
        setBioTextViewConstraints(text: bioTextView)
        setFollowButtonConstraints(button: followButton)
        setSeperatorViewLayoutConstraints(view: seperatorView)
    }
    
    private func addSubViewsInsideMainViews(){
        addSubview(imageView)
        addSubview(tweetLabel)
        addSubview(usernameLabel)
        addSubview(bioTextView)
        addSubview(followButton)
        addSubview(seperatorView)
    }
    
    private let imageView : UIImageView = {
       let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = #imageLiteral(resourceName: "iu")
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        //        image.backgroundColor = .red
        return image
    }()
    
    private let tweetLabel : UILabel = {
       let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "Karim Gohar"
        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "@piooneer77"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
//        label.backgroundColor = UIColor.yellow
        return label
    }()
    
    private let bioTextView : UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
//        text.text = "The company experienced rapid initial growth. It had 400,000 tweets posted per quarter in 2007. This grew to 100 million tweets posted per quarter in 2008"
        text.font = UIFont.systemFont(ofSize: 16)
        text.backgroundColor = .clear
        text.isScrollEnabled = false
//        text.backgroundColor = UIColor.darkGray
        return text
    }()
    
    private lazy var followButton : UIButton = {
       let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitle("Follow", for: .normal)
        button.setTitleColor(twitterColor, for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 14)
        button.layer.borderWidth = 1
        button.layer.borderColor = twitterColor.cgColor
        return button
    }()
    
    private let seperatorView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.lightGray
        return view
    }()
    
    private func setSeperatorViewLayoutConstraints(view : UIView){
        NSLayoutConstraint.activate([
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: 0),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            view.heightAnchor.constraint(equalToConstant: 1)
        ])
    }
    
    private func setImageConstraints(image : UIImageView){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setTweetLabelConstraints(label : UILabel){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -8),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private func setUsernameLabelConstraints(label : UILabel){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: tweetLabel.bottomAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            label.trailingAnchor.constraint(equalTo: followButton.leadingAnchor, constant: -8),
            label.heightAnchor.constraint(equalToConstant: 20)
            ])
    }
    
    private func setBioTextViewConstraints(text : UITextView){
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            text.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            text.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            text.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
    
    private func setFollowButtonConstraints(button : UIButton){
        NSLayoutConstraint.activate([
            button.heightAnchor.constraint(equalToConstant: 30),
            button.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            button.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            button.widthAnchor.constraint(equalToConstant: 100)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
