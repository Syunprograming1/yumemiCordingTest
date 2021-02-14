//
//  SearchViewCellData.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/14.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

enum SearchViewCellType {
    case repository(repository: RepositoryModel)
    case empty(imageName: String, emptyText: String)
    case notFound(notFoundText: String)
}

// enumでcellの順番を持つようにしてベタがきすると順番を変えたくなったりした時楽なのでこういう感じ（例えば後から広告を入れたくなった時など）
class SearchViewCellData {
    
    var cellData = [SearchViewCellType]()
    func setData(searchWord: String, repositoryList: [RepositoryModel]) -> [SearchViewCellType]{
        // 空白の時(最初）
        if searchWord == "" {
            appendEmpty()
        }
        
        // 検索結果がなしの時
        else if repositoryList.count == 0 {
            appendNotFound()
        }
        // ヒットした時
        else {
            repositoryList.forEach{
                cellData.append(.repository(repository: $0))
            }
        }
        
        return cellData
    }
}

extension SearchViewCellData {
    private func appendEmpty(){
        let emptytext = """
        ここにライブラリの一覧が表示されます
        上の検索バーから検索
        """
        cellData.append(.empty(imageName: "square.stack.3d.up.fill", emptyText: emptytext))
    }
}

extension SearchViewCellData {
    private func appendNotFound(){
        let text = """
        一致する検索結果が見つかりませんでした
        別のワードで検索してください
        """
        cellData.append(.notFound(notFoundText: text))
    }
}
