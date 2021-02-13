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
    
    var taskModel = TaskModel()
    
    var repositoryList : [[String: Any]] = [] {
        didSet {
            repositoryTableViewDataSorce.repositoryList = repositoryList
        }
    }
    var tappedCellIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBarSetUp()
        repositoryTableViewSetUp()
    }
    
}

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
        taskModel.task?.cancel()
    }
}

extension SearchViewController {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let searchWord = searchBar.text!
        
        if searchWord.count != 0 {
            guard let url = taskUrl(searchWord: searchWord) else { return }
            
            taskModel.task = URLSession.shared.dataTask(with: url) {(data, res, err) in
                let obj = self.taskModel.jsonObject(data: data)
                self.repositoryList = self.taskModel.repositoryList(jsonObject: obj)
                DispatchQueue.main.async {
                    self.repositoryTableView.reloadData()
                }
            }
            //　リストを更新するため
            taskModel.task?.resume()
        }
        
    }
}

extension SearchViewController {
    private func taskUrl(searchWord: String) -> URL? {
        let url = taskModel.getUrl(searchWord: searchWord)
        return URL(string: url)
    }
}

extension SearchViewController {
    private func repositoryTableViewSetUp(){
        repositoryTableView.delegate = self
        repositoryTableView.dataSource = repositoryTableViewDataSorce
        repositoryTableView.register(UINib(nibName: "RepositoryTableViewCell", bundle: nil), forCellReuseIdentifier: "RepositoryTableViewCell")
    }
}

extension SearchViewController {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let repositoryDetailsView = self.storyboard!.instantiateViewController(identifier: "RepositoryDetais") as! RepositoryDetailsViewController
        repositoryDetailsView.repository = RepositoryModel(repository: repositoryList[indexPath.row])
        self.navigationController?.pushViewController(repositoryDetailsView, animated: true)
    }
}
