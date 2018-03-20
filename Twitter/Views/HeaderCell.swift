//
//  HeaderCell.swift
//  Twitter
//
//  Created by Apple on 2/10/18.
//  Copyright © 2018 syntaxerror. All rights reserved.
//

import UIKit

class HeaderCell: UICollectionViewCell {
    
    let twitterColor = UIColor(displayP3Red: 0.33, green: 0.6, blue: 0.92, alpha: 1.0)
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .white
        setViewsConstraints()
        
    }
    
    private func setViewsConstraints(){
        addSubViewsInsideMainViews()
        setHeaderLabelConstraints(label: headerLabel)
    }
    
    private func addSubViewsInsideMainViews(){
        addSubview(headerLabel)
    }
    
    
    private lazy var headerLabel : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Who To Follow"
        label.font = UIFont.boldSystemFont(ofSize: 20)
        label.textAlignment = .center
        label.textColor = twitterColor
//        label.backgroundColor = UIColor.lightGray
        return label
    }()
    
    private func setHeaderLabelConstraints(label : UILabel){
        NSLayoutConstraint.activate([
            label.topAnchor.constraint(equalTo: self.topAnchor),
            label.leadingAnchor.constraint(equalTo: self.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: self.trailingAnchor),
            label.heightAnchor.constraint(equalTo: self.heightAnchor)
        ])
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
