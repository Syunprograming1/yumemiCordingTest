//
//  RepositoryTableViewCell.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/13.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {
    
    @IBOutlet weak var repositroyImageView: UIImageView!
    @IBOutlet weak var repositoryButton: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        repositoryButtonSetUp()
        repositoryImageViewSetUp()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}

extension RepositoryTableViewCell {
    private func repositoryButtonSetUp(){
        repositoryButton.backgroundColor = .white
        repositoryButton.layer.cornerRadius = 5
        repositoryButton.setShadow()
    }
}

extension RepositoryTableViewCell {
    private func repositoryImageViewSetUp(){
        repositroyImageView.toCircle()
    }
}

extension RepositoryTableViewCell {
    func setCell(image: UIImage,repositoryName: String){
        repositroyImageView.image = image
        repositoryButton.setTitle(repositoryName, for: .normal)
    }
}
