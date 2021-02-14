//
//  SearchViewDataSorce.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/13.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

class SearchViewDataSorce: NSObject {
    var cellData : [SerchViewCellType]
    var cellDidSelect: ((RepositoryModel) -> Void)?
    
    init(cellData: [SerchViewCellType]){
        self.cellData = cellData
    }
}

extension SearchViewDataSorce : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cellData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellDataType = cellData[indexPath.row]
        switch cellDataType {
        case .repository(repository: let repository):
            return repositoryTableViewCell(repository: repository, tableView: tableView, indexPath: indexPath)
        case .empty(imageName: let imageName, emptyText: let emptyText):
            return emptyTableViewCell(imageName: imageName, text: emptyText, tableView: tableView, indexPath: indexPath)
        case .notFound(notFoundText: let notFoundText):
            return notFoundTableViewCell(text: notFoundText, tableView: tableView, indexPath: indexPath)
        }
    }
}

extension SearchViewDataSorce {
    private func repositoryTableViewCell(repository: RepositoryModel, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RepositoryTableViewCell", for: indexPath ) as! RepositoryTableViewCell
        
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

extension SearchViewDataSorce {
    private func emptyTableViewCell(imageName: String, text: String, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EmptyTableViewCell", for: indexPath ) as! EmptyTableViewCell
        cell.setCell(imageName: imageName, showText: text)
        return cell
    }
}



extension SearchViewDataSorce {
    private func notFoundTableViewCell(text: String, tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "NotFoundTableViewCell", for: indexPath ) as! NotFoundTableViewCell
        cell.setCell(notFoundText: text)
        return cell
    }
}
