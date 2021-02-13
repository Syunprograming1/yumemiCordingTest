//
//  SearchViewDataSorce.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/13.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//
//
//import UIKit
//
//class SearchViewDataSorce: NSObject {
//    var repositoryList : [[String: Any]]
//    var cellDidSelect: ((IndexPath) -> Void)?
//
//    init(repositoryList: [[String: Any]]){
//        self.repositoryList = repositoryList
//    }
//}
//
//extension SearchViewDataSorce : UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return repositoryList.count
//    }
//
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//
//        let cell = UITableViewCell()
//        let rp = repositoryList[indexPath.row]
//        cell.textLabel?.text = rp["full_name"] as? String ?? ""
//        cell.detailTextLabel?.text = rp["language"] as? String ?? ""
//        cell.tag = indexPath.row
//        return cell
//
//    }
//
//    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        cellDidSelect?(indexPath)
//    }
//
//}
