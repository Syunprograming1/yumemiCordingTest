//
//  RepositoryDetailsViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {
    
    @IBOutlet weak var libraryImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var stragazersLabel: UILabel!
    @IBOutlet weak var wachersLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var issueLabel: UILabel!
    
    // 画面遷移時に受け取る
    var repository = RepositoryModel(repository: [:])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelsSetUp()
        imageViewSetUp()
    }
}

extension RepositoryDetailsViewController {
    private func labelsSetUp(){
        titleLabel.text = repository.elementString(elementType: .fullName)
        languageLabel.text = "Written in" + repository.elementString(elementType: .language)
        stragazersLabel.text = repository.elementString(elementType: .stargazersCount)  + "stars"
        wachersLabel.text = repository.elementString(elementType: .wachersCount) + " watchers"
        forkLabel.text = repository.elementString(elementType: .forksCount)  + "forks"
        issueLabel.text =  repository.elementString(elementType:  .openIssuesCount) + " open issues"
    }
}

extension RepositoryDetailsViewController {
    func imageViewSetUp(){
        guard let imageUrl = repository.imageUrl() else { return }
        
        URLSession.shared.dataTask(with: imageUrl) { (data, res, err) in
            guard let data = data else { return }
            
            let image = UIImage(data: data)
            DispatchQueue.main.async {
                self.libraryImageView.image = image
            }
        }.resume()
        
    }
}
