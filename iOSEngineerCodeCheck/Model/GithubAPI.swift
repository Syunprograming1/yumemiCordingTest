//
//  TaskModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/12.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation


class GithubAPI {
    static func urlString(searchWord: String) -> String {
        return "https://api.github.com/search/repositories?q=\(searchWord)"
    }
}

extension GithubAPI {
    static func getUrl(searchWord: String) -> URL? {
        let url = urlString(searchWord: searchWord)
        return URL(string: url)
    }
}



extension GithubAPI {
    static func itemsList(jsonObject: [String: Any]) -> [[String: Any]]{
        guard let items = jsonObject["items"] as? [[String: Any]] else {
            print("jsonObjectがnil")
            return []
        }
        return items
    }
}

// itemListを自作のRepositoryListModelに変換する
extension GithubAPI {
    static func repositoryList(jsonObject: [String: Any]) -> [RepositoryModel]{
        var repositoryList = [RepositoryModel]()
        itemsList(jsonObject: jsonObject).forEach{
            repositoryList.append(RepositoryModel(repository: $0))
        }
        return repositoryList
    }
}

extension GithubAPI {
    static func jsonObject(data: Optional<Data>) -> [String: Any]{
        guard  let data = data else {
            print("dataがnilです")
            return [:]
        }
        guard let obj = try! JSONSerialization.jsonObject(with: data) as? [String: Any] else {
            return [:]
        }
        return obj
    }
}

// URlSessionTaskを更新し、repotoryListを入れる
extension GithubAPI {
    static func settingRepositoryList(url: URL, setting: (([RepositoryModel]) -> Void)?) -> URLSessionTask{
        return URLSession.shared.dataTask(with: url) {(data, res, err) in
            let obj = GithubAPI.jsonObject(data: data)
            setting?(GithubAPI.repositoryList(jsonObject: obj))
        }
    }
}
