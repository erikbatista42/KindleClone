//
//  BookCell.swift
//  KindleClone
//
//  Created by Erik Batista on 7/3/17.
//  Copyright © 2017 swift.lang.eu. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    let coverImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.backgroundColor = .red
        return imageView
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.text = "This is the text for the title of our book inside of out cell"
        label.backgroundColor = .blue
        return label
    }()
    
    let authorLabel: UILabel = {
        let label = UILabel()
        label.text = "Thisi some author for the boook that we have in this row"
         label.backgroundColor = .green
        return label
    }()
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Cell is being initialized..")
        backgroundColor = .yellow
        
        addSubview(coverImageView)
        coverImageView.frame = CGRect(x: 8, y: 8, width: 50, height: 64)
        
        addSubview(titleLabel)
        titleLabel.frame = CGRect(x: 66, y: 20, width: 200, height: 20)
        
        addSubview(authorLabel)
        authorLabel.frame = CGRect(x: 66, y: 48, width: 200, height: 20)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coderL) has not been implemented")
    }
}
