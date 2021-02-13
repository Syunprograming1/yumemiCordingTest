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
        repositoryImage(repository: repository, imageSetiing: {(image) in
            let cellText = repository.elementString(elementType: .fullName) + "/" + repository.elementString(elementType: .language)
            cell.setCell(image: image, repositoryName: cellText)
        })
        return cell
    }
}

extension SearchViewDataSorce {
    private func repositoryImage(repository: RepositoryModel, imageSetiing: ((UIImage) -> Void)?) {
        var image = UIImage()
        guard let imageUrl = repository.imageUrl() else { return}
        
        URLSession.shared.dataTask(with: imageUrl) { (data, res, err) in
            guard let data = data else { return }
            image = UIImage(data: data) ?? UIImage()
            DispatchQueue.main.async {
                imageSetiing?(image)
            }
        }.resume()
    }
}
