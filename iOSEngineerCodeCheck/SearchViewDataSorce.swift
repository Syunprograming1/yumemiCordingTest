//
//  SearchViewDataSorce.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/13.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchViewDataSorce: NSObject {
    var repositoryList : [[String: Any]]
    var cellDidSelect: ((IndexPath) -> Void)?
    
    init(repositoryList: [[String: Any]]){
        self.repositoryList = repositoryList
    }
}

extension SearchViewDataSorce : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell", for: indexPath ) as! RepositoryTableViewCell
        let repository =  RepositoryModel(repository:repositoryList[indexPath.row])
        cell.setCell(repositoryName: repository.elementString(elementType: .fullName) + "/" + repository.elementString(elementType: .language))
        return cell
    }
}
