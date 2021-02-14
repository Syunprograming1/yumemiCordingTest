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
    var searchWord = ""
    
    @IBOutlet weak var repositoryTableView: UITableView!
    var repositoryTableViewDataSorce = SearchViewDataSorce(cellData: SearchViewCellData().setData(searchWord: "", repositoryList: []))
    var cellDataArray : [SearchViewCellType] = []
    
    var repositoryList : [RepositoryModel] = [] {
        didSet{
            cellDataArray = SearchViewCellData().setData(searchWord: searchWord, repositoryList: repositoryList)
            repositoryTableViewDataSorce.cellData = cellDataArray
        }
    }
    var task: URLSessionTask?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBarSetUp()
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
            searchBar.placeholder = "GitHubのリポジトリを検索"
            searchBar.tintColor = UIColor.gray
            searchBar.keyboardType = UIKeyboardType.default
            searchBar.searchTextField.backgroundColor = .veryLitleGray
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
        searchWord = searchBar.text!
        
        guard let url = GithubAPI.getUrl(searchWord: searchWord) else { return }
        task = GithubAPI.settingRepositoryList(url: url, setting: {(reposiryModelList) in
            self.repositoryList = reposiryModelList
            DispatchQueue.main.async {
                self.repositoryTableView.reloadData()
            }
        })
        //　リストを更新するため
        task?.resume()
        
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
        repositoryTableView.nibRegister(nibName: "RepositoryTableViewCell")
        repositoryTableView.nibRegister(nibName: "EmptyTableViewCell")
        repositoryTableView.nibRegister(nibName: "NotFoundTableViewCell")
        
        repositoryTableView.tableFooterView = UIView()
        repositoryTableView.contentInset = UIEdgeInsets(top: 10.0, left: 0, bottom: 0, right: 0)
        //buttonでタップを判断したいのでcellのタップは消しておく
        repositoryTableView.allowsSelection = false
        repositoryTableView.backgroundColor = .veryLitleGray
    }
}


// --- navigationBar関係
extension SearchViewController {
    private func navigationBarSetUp(){
        self.navigationController?.navigationBar.commonSetUp()
    }
}
