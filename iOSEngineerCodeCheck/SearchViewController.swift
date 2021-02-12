//
//  SearchViewController.swift
//  iOSEngineerCodeCheck
//
//  Created by 史 翔新 on 2020/04/20.
//  Copyright © 2020 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchViewController: UITableViewController, UISearchBarDelegate {
    
    @IBOutlet weak var searchBar: UISearchBar!
    
    var githubAPIModel = GitHubAPIModel()
    var repositoryList = [[String: Any]]()
    var tappedCellIndex: Int!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.text = "GitHubのリポジトリを検索できるよー"
        searchBar.delegate = self
    }
    
}

extension SearchViewController {
    func searchBarShouldBeginEditing(_ searchBar: UISearchBar) -> Bool {
        // ↓こうすれば初期のテキストを消せる
        searchBar.text = ""
        return true
    }
}


extension SearchViewController {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        githubAPIModel.task?.cancel()
    }
}

extension SearchViewController {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        
        let searchWord = searchBar.text!
        
        if searchWord.count != 0 {
            let url = githubAPIModel.getUrl(searchWord: searchWord)
            githubAPIModel.task = URLSession.shared.dataTask(with: URL(string: url)!) {(data, res, err) in
                let obj = self.githubAPIModel.jsonObject(data: data)
                self.repositoryList = self.githubAPIModel.repositoryList(jsonObject: obj)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
            //　リストを更新するため
            githubAPIModel.task?.resume()
        }
        
    }
}

extension SearchViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "Detail"{
            let dtl = segue.destination as! RepositoryDetailsViewController
            dtl.repository = repositoryList[tappedCellIndex]
        }
        
    }
}


extension SearchViewController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryList.count
    }
}


extension SearchViewController {
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = UITableViewCell()
        let rp = repositoryList[indexPath.row]
        cell.textLabel?.text = rp["full_name"] as? String ?? ""
        cell.detailTextLabel?.text = rp["language"] as? String ?? ""
        cell.tag = indexPath.row
        return cell
        
    }
}


extension SearchViewController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 画面遷移時に呼ばれる
        tappedCellIndex = indexPath.row
        performSegue(withIdentifier: "Detail", sender: self)
        
    }
}
