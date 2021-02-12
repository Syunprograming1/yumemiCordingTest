//
//  GithubAPIModel.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/12.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

//import Foundation
//
//class GitHubAPIModel {
////    var repository: [String: Any] = [:]
////    var task: URLSessionTask?
//}

//extension GitHubAPIModel {
//    enum RepositoryElementType {
//        case fullName
//        case language
//        case stargazersCount
//        case wachersCount
//        case forksCount
//        case openIssuesCount
//    }
//}
//
//extension GitHubAPIModel {
//    static  func elementString(repository: [String: Any], elementType: RepositoryElementType) -> String {
//        switch elementType {
//        case .fullName:
//            return repository["full_name"] as? String ?? ""
//        case .language:
//            return repository["language"] as? String ?? ""
//        case .stargazersCount:
//            return "\(repository["stargazers_count"] as? Int ?? 0)"
//        case .wachersCount:
//            return "\(repository["wachers_count"] as? Int ?? 0)"
//        case .forksCount:
//            return "\(repository["forks_count"] as? Int ?? 0)"
//        case .openIssuesCount:
//            return "\(repository["open_issues_count"] as? Int ?? 0)"
//        }
//    }
//}

//extension GitHubAPIModel {
//   func getUrl(searchWord: String) -> String {
//        return "https://api.github.com/search/repositories?q=\(searchWord)"
//    }
//}
//
//
//extension GitHubAPIModel {
//    func repositoryList(jsonObject: [String: Any]) -> [[String: Any]]{
//        guard let items = jsonObject["items"] as? [[String: Any]] else {
//            print("jsonObjectがnil")
//            return []
//        }
//        return items
//    }
//}
//
//extension GitHubAPIModel {
//    func jsonObject(data: Optional<Data>) -> [String: Any]{
//        guard let obj = try! JSONSerialization.jsonObject(with: data!) as? [String: Any] else {
//            return [:]
//        }
//        return obj
//    }
//}

