//
//  NotFoundTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/14.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class NotFoundTableViewCell: UITableViewCell {

    @IBOutlet weak var notFountLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        self.backgroundColor = .veryLitleGray
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
    func setCell(notFoundText: String){
        notFountLabel.text = notFoundText
    }
}
