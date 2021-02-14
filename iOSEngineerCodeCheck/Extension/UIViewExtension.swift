//
//  UIViewExtension.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/13.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

extension UIView {
    func setLitleShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        self.layer.shadowOpacity = 0.3
    }
    
    func setBigShadow(){
        self.layer.shadowColor = UIColor.black.cgColor
        self.layer.shadowRadius = 10
        self.layer.shadowOffset = CGSize(width: 0.5, height: 0.5)
        self.layer.shadowOpacity = 0.3
    }
}
