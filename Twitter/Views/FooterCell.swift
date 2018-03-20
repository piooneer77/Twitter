//
//  FooterCell.swift
//  Twitter
//
//  Created by Apple on 2/10/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class FooterCell: UICollectionViewCell {
    
    let twitterColor = UIColor(displayP3Red: 0.33, green: 0.6, blue: 0.92, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViewsConstraints()
    }
    
    private func setViewsConstraints(){
        addSubViewsInsideMainViews()
        setFooterLabelConstraints(label: footerLabel)
        setBackGroundViewConstraints(view: backGroundView)
    }
    
    private func addSubViewsInsideMainViews(){
        addSubview(backGroundView)
        addSubview(footerLabel)
    }
    
    private let backGroundView : UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = UIColor.white
        return view
    }()
    
    private func setBackGroundViewConstraints (view : UIView){
        NSLayoutConstraint.activate([
            view.topAnchor.constraint(equalTo: self.topAnchor),
            view.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            view.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            view.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14)
        ])
    }
    
    private lazy var footerLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Show More"
        label.font = UIFont.boldSystemFont(ofSize: 15)
        label.textAlignment = .center
        label.textColor = twitterColor
        return label
    }()
    
    private func setFooterLabelConstraints(label : UILabel){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -14)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
