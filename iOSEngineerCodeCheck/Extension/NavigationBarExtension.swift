//
//  NavigationBarExtension.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/14.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

// 下線関係
extension UINavigationBar {
    private func deleteLine(){
        //下の線を消す
        self.shadowImage = UIImage()
    }
    
    private func addShadowLine(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowRadius = 3.0
        self.layer.shadowOpacity = 0.1
        self.layer.masksToBounds = false
    }
    
}

extension UINavigationBar {
    private func toWhite(){
        self.barTintColor = UIColor.white
    }
}

extension UINavigationBar {
    func commonSetUp(){
        deleteLine()
        addShadowLine()
        toWhite()
    }
}

