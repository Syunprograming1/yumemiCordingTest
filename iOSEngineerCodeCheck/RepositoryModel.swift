//
//  RepositoryModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/12.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import Foundation

class  RepositoryModel {
    var repository: [String: Any] = [:]
    
    init(repository: [String: Any]) {
        self.repository = repository
    }
}


extension RepositoryModel {
    enum RepositoryElementType {
        case fullName
        case language
        case stargazersCount
        case wachersCount
        case forksCount
        case openIssuesCount
        case imageURL
    }
}

extension RepositoryModel {
    func elementString(elementType: RepositoryElementType) -> String {
        switch elementType {
        case .fullName:
            return repository["full_name"] as? String ?? ""
        case .language:
            return repository["language"] as? String ?? ""
        case .stargazersCount:
            return "\(repository["stargazers_count"] as? Int ?? 0)"
        case .wachersCount:
            return "\(repository["wachers_count"] as? Int ?? 0)"
        case .forksCount:
            return "\(repository["forks_count"] as? Int ?? 0)"
        case .openIssuesCount:
            return "\(repository["open_issues_count"] as? Int ?? 0)"
        case .imageURL:
            guard let owner = repository["owner"] as? [String: Any] else {
                print("ownerが不明nil")
                return ""
            }
            return owner["avatar_url"] as? String ?? ""
        }
    }
}
