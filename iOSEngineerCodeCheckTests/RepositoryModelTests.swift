//
//  RepositoryModelTests.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 小西俊輔 on 2021/02/14.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import XCTest
@testable import iOSEngineerCodeCheck

class RepositoryModelTests: XCTestCase {
    
    
    private func createRepositoryModel(name: String,language: String,count: Int, owner: [String: Any]) -> RepositoryModel{
        let repository = [
            "full_name": name,
            "language":  language,
            "stargazers_count": count,
            "wachers_count": count,
            "forks_count": count,
            "open_issues_count": count,
            "owner": owner
        ] as [String : Any]
        
        return RepositoryModel(repository: repository)
    }
    
    private func createOwner(url: String) -> [String : Any]{
        let owner = [
            "avatar_url": url
        ] as [String : Any]
        
        return owner
    }
    
    func testElementString() throws {
        let owner = createOwner(url: "http")
        let name = "realm/cocoa"
        let language = "Swift"
        let count = 100
        let countString  = "100"
        let repository = createRepositoryModel(name: name, language: language, count: count, owner: owner)
        XCTAssertEqual(name, repository.elementString(elementType: .fullName))
        XCTAssertEqual(language, repository.elementString(elementType: .language))
        XCTAssertEqual(countString, repository.elementString(elementType: .stargazersCount))
        XCTAssertEqual(countString, repository.elementString(elementType: .wachersCount))
        XCTAssertEqual(countString, repository.elementString(elementType: .forksCount))
        XCTAssertEqual(countString, repository.elementString(elementType: .openIssuesCount))
        XCTAssertEqual("http", repository.elementString(elementType: .imageURL))
        
    }
    
    
    
    
    
}
