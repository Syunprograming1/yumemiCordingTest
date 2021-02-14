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
        let url = "http"
        let owner = createOwner(url: url)
        let name = "realm/cocoa"
        let language = "ObjectC"
        let count = 100
        let countString  = "100"
        let repository = createRepositoryModel(name: name, language: language, count: count, owner: owner)
        XCTAssertEqual(name, repository.elementString(elementType: .fullName))
        XCTAssertEqual(language, repository.elementString(elementType: .language))
        XCTAssertEqual(countString, repository.elementString(elementType: .stargazersCount))
        XCTAssertEqual(countString, repository.elementString(elementType: .wachersCount))
        XCTAssertEqual(countString, repository.elementString(elementType: .forksCount))
        XCTAssertEqual(countString, repository.elementString(elementType: .openIssuesCount))
        XCTAssertEqual(url, repository.elementString(elementType: .imageURL))
        
    }
    
    
    func testImageUrl(){
        let url = "http"
        let owner = createOwner(url: url)
        let repository = createRepositoryModel(name: "realm/cocoa", language: "ObjectC", count: 100, owner: owner)
        
        let imageUrl = repository.elementString(elementType: .imageURL)
        XCTAssertEqual(URL(string: url), URL(string: imageUrl))
    }
    
    
}
