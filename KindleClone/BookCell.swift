//
//  BookCell.swift
//  KindleClone
//
//  Created by Erik Batista on 7/3/17.
//  Copyright © 2017 swift.lang.eu. All rights reserved.
//

import UIKit

class BookCell: UITableViewCell {
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        print("Cell is being initialized..")
        backgroundColor = .yellow
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coderL) has not been implemented")
    }
}
