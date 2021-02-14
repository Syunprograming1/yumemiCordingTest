//
//  RepositoryDetailsViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/21.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class RepositoryDetailsViewController: UIViewController {
    
    var backBarButtonItem: UIBarButtonItem!
    
    @IBOutlet weak var imageBackView: UIView!
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
        
        navigationBarSetUp()
        backBarButtonItemSetUp()
        labelsSetUp()
        imageBackViewSetUp()
        imageViewSetUp()
    }
    
    
    @objc func backButtonDidTaped(_ sender: UIButton){
        self.navigationController?.popViewController(animated: true)
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
    private func imageBackViewSetUp(){
        imageBackView.setBigShadow()
        // 重ねているのでゼロにして違和感を消す
        imageBackView.layer.shadowOffset = .zero
        imageBackView.layer.cornerRadius = imageBackView.frame.width/2
    }
}

extension RepositoryDetailsViewController {
    private func imageViewSetUp(){
        repository.imageSeting(imageSetiing: {(image) in
            self.libraryImageView.image = image
        })
        libraryImageView.toCircle()
    }
}

// --- navigationbar関係

extension RepositoryDetailsViewController {
    private func navigationBarSetUp(){
        self.navigationController?.navigationBar.commonSetUp()
    }
}

extension RepositoryDetailsViewController {
    private func backBarButtonItemSetUp(){
        // カスタムの戻るボタンを作成
        let backButton = UIButton()
        backButton.setSystemImage(type: .back)
        backButton.tintColor = .darkGray
        backButton.addTarget(self, action: #selector(backButtonDidTaped(_:)), for: .touchUpInside)
        // navigationBarItemに設置
        backBarButtonItem = UIBarButtonItem(customView: backButton)
        self.navigationItem.leftBarButtonItem = backBarButtonItem
    }
}
