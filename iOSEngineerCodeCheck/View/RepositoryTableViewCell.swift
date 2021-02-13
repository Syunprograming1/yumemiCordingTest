//
//  RepositoryTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/13.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var backView: UIView!
    @IBOutlet weak var repositroyImageView: UIImageView!
    @IBOutlet weak var repositoryFullName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        backViewSetUp()
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    
}

extension RepositoryTableViewCell {
    private func backViewSetUp(){
        backView.backgroundColor = .white
        backView.layer.cornerRadius = 5
        backView.setShadow()
    }
}


extension RepositoryTableViewCell {
    func setCell(image: UIImage,repositoryName: String){
        repositroyImageView.image = image
        repositoryFullName.text = repositoryName
    }
}
