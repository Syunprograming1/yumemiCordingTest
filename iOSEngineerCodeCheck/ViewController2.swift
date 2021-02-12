//
//  ViewController2.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class ViewController2: UIViewController {
    
    @IBOutlet weak var libraryImageView: UIImageView!
    
    @IBOutlet weak var titleLabel: UILabel!
    
    @IBOutlet weak var languageLabel: UILabel!
    
    @IBOutlet weak var stragazersLabel: UILabel!
    @IBOutlet weak var wachersLabel: UILabel!
    @IBOutlet weak var forkLabel: UILabel!
    @IBOutlet weak var issueLabel: UILabel!
    
    var vc1: ViewController!
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repo = vc1.repository[vc1.tappedCellIndex]
        
        languageLabel.text = "Written in \(repo["language"] as? String ?? "")"
        stragazersLabel.text = "\(repo["stargazers_count"] as? Int ?? 0) stars"
        wachersLabel.text = "\(repo["wachers_count"] as? Int ?? 0) watchers"
        forkLabel.text = "\(repo["forks_count"] as? Int ?? 0) forks"
        issueLabel.text = "\(repo["open_issues_count"] as? Int ?? 0) open issues"
        getImage()
        
    }
    
    func getImage(){
        
        let repo = vc1.repository[vc1.tappedCellIndex]
        
        titleLabel.text = repo["full_name"] as? String
        
        if let owner = repo["owner"] as? [String: Any] {
            if let imgURL = owner["avatar_url"] as? String {
                URLSession.shared.dataTask(with: URL(string: imgURL)!) { (data, res, err) in
                    let img = UIImage(data: data!)!
                    DispatchQueue.main.async {
                        self.libraryImageView.image = img
                    }
                }.resume()
            }
        }
        
    }
    
}
