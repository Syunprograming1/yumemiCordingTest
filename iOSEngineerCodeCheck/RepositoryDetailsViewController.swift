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
    
    var repository: [String: Any] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        labelsSetUp()
        getImage()
        
    }
    
    
    
}

extension RepositoryDetailsViewController {
    private func labelsSetUp(){
        languageLabel.text = "Written in \(repository["language"] as? String ?? "")"
        stragazersLabel.text = "\(repository["stargazers_count"] as? Int ?? 0) stars"
        wachersLabel.text = "\(repository["wachers_count"] as? Int ?? 0) watchers"
        forkLabel.text = "\(repository["forks_count"] as? Int ?? 0) forks"
        issueLabel.text = "\(repository["open_issues_count"] as? Int ?? 0) open issues"
    }
}

extension RepositoryDetailsViewController {
    func getImage(){
        titleLabel.text = repository["full_name"] as? String
        
        guard let owner = repository["owner"] as? [String: Any] else {
            return
        }
        
        guard let imgURL = owner["avatar_url"] as? String  else {
            return
        }
        
        URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, res, err) in
            let img = UIImage(data: data!)!
            DispatchQueue.main.async {
                self.libraryImageView.image = img
            }
        }.resume()
        
    }
}
