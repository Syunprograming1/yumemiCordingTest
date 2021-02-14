//
//  UrlAPITests.swift
//  iOSEngineerCodeCheckTests
//
//  Created by 小西俊輔 on 2021/02/14.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import XCTest
@testable import iOSEngineerCodeCheck

class GithubAPITests: XCTestCase {
    
    func testUrlString() {
        let searchWord = "Realm"
        let suppose = "https://api.github.com/search/repositories?q=\(searchWord)"
        XCTAssertEqual(suppose, GithubAPI.urlString(searchWord: searchWord))
    }
    
    func testGetUrl(){
        let suppose = URL(string: GithubAPI.urlString(searchWord: "Realm"))
        XCTAssertEqual(suppose, GithubAPI.getUrl(searchWord: "Realm"))
    }
}
