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
        setLabelConstraints(label: tweetLabel)
        setImageConstraints(image: imageView)
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
    
    private func setImageConstraints(image : UIImageView){
        addSubview(image)
        NSLayoutConstraint.activate([
            image.topAnchor.constraint(equalTo: self.topAnchor, constant: 12),
            image.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 12),
            image.widthAnchor.constraint(equalToConstant: 50),
            image.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    private func setLabelConstraints(label : UILabel){
        addSubview(tweetLabel)
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor, constant: 15),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 70),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            label.heightAnchor.constraint(equalToConstant: 30)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
