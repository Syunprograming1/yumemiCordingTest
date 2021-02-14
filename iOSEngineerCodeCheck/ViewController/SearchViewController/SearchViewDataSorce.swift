//
//  SearchViewDataSorce.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/13.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchViewDataSorce: NSObject {
    var repositoryList : [RepositoryModel]
    var cellDidSelect: ((RepositoryModel) -> Void)?
    
    init(repositoryList: [RepositoryModel]){
        self.repositoryList = repositoryList
    }
}

extension SearchViewDataSorce : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell", for: indexPath ) as! RepositoryTableViewCell
        
        let repository = repositoryList[indexPath.row]
        repository.imageSeting(imageSetiing: {(image) in
            let cellText = repository.elementString(elementType: .fullName) + "/" + repository.elementString(elementType: .language)
            cell.setCell(image: image, repositoryName: cellText)
        })
        cell.buttonDidTaped = { [unowned self] in
            cellDidSelect?(repository)
        }
        return cell
    }
}
