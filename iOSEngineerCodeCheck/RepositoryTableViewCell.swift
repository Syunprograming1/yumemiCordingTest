//
//  RepositoryTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/13.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var repositoryImageView: UIImageView!
    @IBOutlet weak var repositoryFullName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    
}


extension RepositoryTableViewCell {
    func setCell(repositoryName: String){
//        repositoryImageView.image = image
        repositoryFullName.text = repositoryName
    }
}
