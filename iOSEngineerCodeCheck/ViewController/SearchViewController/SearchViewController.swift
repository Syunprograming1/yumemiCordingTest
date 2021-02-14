//
//  SearchViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController,UITableViewDelegate,UISearchBarDelegate {
    
    var searchBar:UISearchBar!
    
    @IBOutlet weak var repositoryTableView: UITableView!
    var repositoryTableViewDataSorce = SearchViewDataSorce(repositoryList: [])
    var repositoryList : [RepositoryModel] = [] {
        didSet {
            repositoryTableViewDataSorce.repositoryList = repositoryList
        }
    }
    var tappedCellIndex = 0
    var task: URLSessionTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBarSetUp()
        dataSorceSetUp()
        repositoryTableViewSetUp()
    }
    
}

// --- searchBar関係

extension SearchViewController {
    func searchBarSetUp(){
        if let navigationBarFrame = navigationController?.navigationBar.bounds {
            let searchBar: UISearchBar = UISearchBar(frame: navigationBarFrame)
            searchBar.delegate = self
            searchBar.placeholder = "GitHubのリポジトリを検索できるよー"
            searchBar.tintColor = UIColor.gray
            searchBar.keyboardType = UIKeyboardType.default
            navigationItem.titleView = searchBar
            navigationItem.titleView?.frame = searchBar.frame
            self.searchBar = searchBar
        }
    }
}

extension SearchViewController {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        task?.cancel()
    }
}

extension SearchViewController {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchWord = searchBar.text!
        
        if searchWord.count != 0 {
            guard let url = UrlAPI.getUrl(searchWord: searchWord) else { return }
            task = UrlAPI.settingRepositoryList(url: url, setting: {(reposiryModelList) in
                self.repositoryList = reposiryModelList
                DispatchQueue.main.async {
                    self.repositoryTableView.reloadData()
                }
            })
            //　リストを更新するため
            task?.resume()
        }
        
    }
}

// --- TableView関係

extension SearchViewController {
    private func dataSorceSetUp(){
        cellDidSelected()
    }
}

extension SearchViewController {
    private func cellDidSelected(){
        repositoryTableViewDataSorce.cellDidSelect = { [unowned self] repository in
            let repositoryDetailsView = self.storyboard!.instantiateViewController(identifier: "RepositoryDetais") as! RepositoryDetailsViewController
            repositoryDetailsView.repository = repository
            self.navigationController?.pushViewController(repositoryDetailsView, animated: true)
        }
    }
}

extension SearchViewController {
    private func repositoryTableViewSetUp(){
        repositoryTableView.delegate = self
        repositoryTableView.dataSource = repositoryTableViewDataSorce
        repositoryTableView.register(UINib(nibName: "RepositoryTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoryTableViewCell")
        repositoryTableView.tableFooterView = UIView()
    }
}
