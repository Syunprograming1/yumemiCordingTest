//
//  TaskModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/12.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation


class UrlAPI {
    static func urlString(searchWord: String) -> String {
        return "https://api.github.com/search/repositories?q=\(searchWord)"
    }
}

extension UrlAPI {
    static func getUrl(searchWord: String) -> URL? {
        let url = urlString(searchWord: searchWord)
        return URL(string: url)
    }
}



extension UrlAPI {
    static func itemsList(jsonObject: [String: Any]) -> [[String: Any]]{
        guard let items = jsonObject["items"] as? [[String: Any]] else {
            print("jsonObjectがnil")
            return []
        }
        return items
    }
}

// itemListを自作のRepositoryListModelに変換する
extension UrlAPI {
    static func repositoryList(jsonObject: [String: Any]) -> [RepositoryModel]{
        var repositoryList = [RepositoryModel]()
        itemsList(jsonObject: jsonObject).forEach{
            repositoryList.append(RepositoryModel(repository: $0))
        }
        return repositoryList
    }
}

extension UrlAPI {
    static func jsonObject(data: Optional<Data>) -> [String: Any]{
        guard let obj = try! JSONSerialization.jsonObject(with: data!) as? [String: Any] else {
            return [:]
        }
        return obj
    }
}

