//
//  EmptyTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/14.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class EmptyTableViewCell: UITableViewCell {

    @IBOutlet weak var showImage: UIImageView!
    @IBOutlet weak var showTextLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .veryLitleGray
        showImage.tintColor = .veryLitleGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(image: UIImage, showText: String){
        showImage.image = image
        showTextLabel.text = showText
        
    }
}
