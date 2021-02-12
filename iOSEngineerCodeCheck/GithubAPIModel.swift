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
    func url(searchWord: String) -> String {
        return "https://api.github.com/search/repositories?q=\(searchWord)"
    }
}
