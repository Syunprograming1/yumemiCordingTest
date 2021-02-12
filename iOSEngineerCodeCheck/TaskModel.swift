//
//  TaskModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/12.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation


class TaskModel {
    var task: URLSessionTask?
}

extension TaskModel {
   func getUrl(searchWord: String) -> String {
        return "https://api.github.com/search/repositories?q=\(searchWord)"
    }
}


extension TaskModel {
    func repositoryList(jsonObject: [String: Any]) -> [[String: Any]]{
        guard let items = jsonObject["items"] as? [[String: Any]] else {
            print("jsonObjectがnil")
            return []
        }
        return items
    }
}

extension TaskModel {
    func jsonObject(data: Optional<Data>) -> [String: Any]{
        guard let obj = try! JSONSerialization.jsonObject(with: data!) as? [String: Any] else {
            return [:]
        }
        return obj
    }
}
