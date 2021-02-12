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
    
    var repository = RepositoryModel(repository: [:])
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelsSetUp()
        getImage()
        
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
    func getImage(){
        
        let imageURL = repository.elementString(elementType: .imageURL)
        URLSession.shared.dataTask(with: URL(string: imageURL)!) { (data, res, err) in
            let image = UIImage(data: data!)!
            DispatchQueue.main.async {
                self.libraryImageView.image = image
            }
        }.resume()
        
    }
}
