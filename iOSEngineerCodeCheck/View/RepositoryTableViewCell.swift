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
    var buttonDidTaped: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        repositoryButtonSetUp()
        repositoryImageViewSetUp()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @objc func repositoryButtonTaped(_ sender: UIButton){
        buttonDidTaped?()
    }
}

extension RepositoryTableViewCell {
    private func repositoryButtonSetUp(){
        repositoryButton.backgroundColor = .white
        repositoryButton.layer.cornerRadius = 5
        repositoryButton.setLitleShadow()
        //　この作りだとimageと重なるので左からずらす
        repositoryButton.titleEdgeInsets = UIEdgeInsets(top: 0, left: 50, bottom: 0, right: 0)
        repositoryButton.addTarget(self, action: #selector(repositoryButtonTaped(_:)), for: .touchUpInside)
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
