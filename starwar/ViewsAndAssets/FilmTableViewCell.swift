//
//  FilmTableViewCell.swift
//  starwar
//
//  Created by seintsan on 3/6/20.
//  Copyright © 2020 seintsan. All rights reserved.
//
import UIKit

class FilmTableViewCell: UITableViewCell {
 
    @IBOutlet weak var lblFilmName: UILabel!
    
    @IBOutlet weak var lblDirector: UILabel!
    
    @IBOutlet weak var lblProducer: UILabel!
    
    override func layoutSubviews() {
        
        super.layoutSubviews()
         contentView.frame = contentView.frame.inset(by: UIEdgeInsets(top: 10, left: 0, bottom: 10, right: 0))
        
        contentView.layer.borderWidth = 1.0
        contentView.layer.borderColor = UIColor.gray.cgColor
    }
    
}
