//
//  TweetCell.swift
//  Twitter
//
//  Created by Apple on 2/24/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class TweetCell: UICollectionViewCell {
    
    var tweet : Tweet? {
        didSet {
            guard let unwrappedTweet = tweet else { return }
            imageView.image = UIImage(named: (unwrappedTweet.user?.image)!)
            tweetLabel.text = unwrappedTweet.user?.name
            bioTextView.text = unwrappedTweet.tweet
            usernameLabel.text = unwrappedTweet.user?.user
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        setViewsConstraints()
    }
    
    private func setViewsConstraints(){
        addSubViewsInsideMainViews()
        setImageConstraints(image: imageView)
        setSeperatorViewLayoutConstraints(view: seperatorView)
        setTweetLabelConstraints(label: tweetLabel)
        setBioTextViewConstraints(text: bioTextView)
        setUsernameLabelConstraints(label: usernameLabel)
//        setButtonsStackViewConstraints(stack: buttonsStackView)
        setReplyButtonViewConstraints(button: replyButton)
        setRetweetButtonViewConstraints(button: retweetButton)
        setLikeButtonViewConstraints(button: likeButton)
        setDirectMessegeButtonViewConstraints(button: directMessegeButton)
        
    }
    
    private func addSubViewsInsideMainViews(){
        addSubview(imageView)
        addSubview(seperatorView)
        addSubview(tweetLabel)
        addSubview(bioTextView)
        addSubview(usernameLabel)
        addSubview(likeButton)
        addSubview(directMessegeButton)
        addSubview(retweetButton)
        addSubview(replyButton)
//        addSubview(buttonsStackView)
    }
    
//    private lazy var buttonsStackView: UIStackView = {
//        let stack = UIStackView(arrangedSubviews: [replyButton, retweetButton, likeButton, directMessegeButton])
//        stack.translatesAutoresizingMaskIntoConstraints = false
//        stack.axis = .horizontal
//        stack.distribution = .fillEqually
////        stack.alignment = .center
//        return stack
//    }()
//
//    private func setButtonsStackViewConstraints (stack : UIStackView){
//        NSLayoutConstraint.activate([
//            stack.bottomAnchor.constraint(equalTo: self.bottomAnchor),
//            stack.leadingAnchor.constraint(equalTo: bioTextView.leadingAnchor),
//            stack.trailingAnchor.constraint(equalTo: bioTextView.trailingAnchor),
//            stack.heightAnchor.constraint(equalToConstant: 30)
//        ])
//    }
    
    private let replyButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "reply"), for: .normal)
        return button
    }()
    
    private func setReplyButtonViewConstraints (button : UIButton){
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: bioTextView.leadingAnchor),
            button.widthAnchor.constraint(equalToConstant: 25),
            button.heightAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    private let retweetButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "retweet"), for: .normal)
        return button
    }()
    
    private func setRetweetButtonViewConstraints (button : UIButton){
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: replyButton.trailingAnchor, constant: 15),
            button.widthAnchor.constraint(equalToConstant: 25),
            button.heightAnchor.constraint(equalToConstant: 25)
            ])
    }
    
    private let likeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "like"), for: .normal)
        return button
    }()
    
    private func setLikeButtonViewConstraints (button : UIButton){
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: retweetButton.trailingAnchor, constant: 15),
            button.widthAnchor.constraint(equalToConstant: 25),
            button.heightAnchor.constraint(equalToConstant: 25)
            ])
    }
    
    private let directMessegeButton : UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setBackgroundImage(#imageLiteral(resourceName: "send_message"), for: .normal)
        return button
    }()
    
    private func setDirectMessegeButtonViewConstraints (button : UIButton){
        NSLayoutConstraint.activate([
            button.bottomAnchor.constraint(equalTo: self.bottomAnchor),
            button.leadingAnchor.constraint(equalTo: likeButton.trailingAnchor, constant: 15),
            button.widthAnchor.constraint(equalToConstant: 25),
            button.heightAnchor.constraint(equalToConstant: 25)
            ])
    }
    
    private let imageView : UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.layer.cornerRadius = 10
        image.layer.masksToBounds = true
        return image
    }()
    
    private func setImageConstraints(image : UIImageView){
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 8),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
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
    
    private let tweetLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.boldSystemFont(ofSize: 16)
//        label.backgroundColor = .red
        return label
    }()
    
    private func setTweetLabelConstraints(label : UILabel){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -8),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    private let bioTextView : UITextView = {
        let text = UITextView()
        text.translatesAutoresizingMaskIntoConstraints = false
        text.font = UIFont.systemFont(ofSize: 16)
        text.backgroundColor = .clear
        text.isScrollEnabled = false
        return text
    }()
    
    private func setBioTextViewConstraints(text : UITextView){
        NSLayoutConstraint.activate([
            text.topAnchor.constraint(equalTo: usernameLabel.bottomAnchor, constant: 5),
            text.leadingAnchor.constraint(equalTo: imageView.trailingAnchor, constant: 8),
            text.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -38),
            text.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -8)
        ])
    }
    
    private let usernameLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
//        label.text = "@piooneer77"
        label.font = UIFont.systemFont(ofSize: 14)
        label.textColor = UIColor.gray
//        label.backgroundColor = UIColor.yellow
        return label
    }()
    
    private func setUsernameLabelConstraints(label : UILabel){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: tweetLabel.bottomAnchor, constant: 8),
            label.leadingAnchor.constraint(equalTo: tweetLabel.leadingAnchor, constant: 8),
            label.trailingAnchor.constraint(equalTo: tweetLabel.trailingAnchor, constant: 8),
            label.heightAnchor.constraint(equalToConstant: 20)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
