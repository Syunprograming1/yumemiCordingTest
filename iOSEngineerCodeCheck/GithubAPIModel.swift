//
//  GithubAPIModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/12.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

class GitHubAPIModel {
    var repository: [[String: Any]]=[]
    var task: URLSessionTask?
}

extension GitHubAPIModel {
    private func getUrl(searchWord: String) -> String {
        return "https://api.github.com/search/repositories?q=\(searchWord)"
    }
}


extension GitHubAPIModel {
    private func setRepository(jsonObject: [String: Any]){
        guard let items = jsonObject["items"] as? [[String: Any]] else {
            print("jsonObjectがnil")
            return
        }
        self.repository = items
    }
}

extension GitHubAPIModel {
    func setTask(searchWord: String, async: @escaping (() -> Void?)){
        let url = getUrl(searchWord: searchWord)
        task = URLSession.shared.dataTask(with: URL(string: url)!) { (data, res, err) in
            guard let obj = try! JSONSerialization.jsonObject(with: data!) as? [String: Any] else {
                return
            }
            self.setRepository(jsonObject: obj)
            DispatchQueue.main.async {
                async()
            }
        }
        // これ呼ばなきゃリストが更新されません
        task?.resume()
    }
}
