//
//  CalendarCell.swift
//  CalendarView
//
//  Created by Paul Ortiz on 8/15/18.
//  Copyright © 2018 Paul Ortiz. All rights reserved.
//

import UIKit

class CalendarCell: UICollectionViewCell {
    
    var label = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        label = UILabel(frame: contentView.frame)
        label.font = UIFont.systemFont(ofSize: 12)
        label.textAlignment = .center
        label.textColor = .black
        contentView.addSubview(label)
    }
    
    required init?(coder aDecoder: NSCoder) {
        return nil
    }
}
