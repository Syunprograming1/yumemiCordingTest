//
//  ButtonExtension.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/14.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

// image関係
extension UIButton {
    // systemnameのimageを名前だけでセットできるように、setSystemImageで使う前提
    private func setSystemNameImage(_ systemName: String){
        self.setImage(UIImage(systemName: systemName), for: .normal)
    }
    
    // そのままだとタップ範囲が固定にならないので大きさを設定しておく
    private func setFrame(){
        self.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
    }
    
    // 指定しておいたimageを簡単にセットできるように
    enum imageType {
        case back
    }
    
    func setSystemImage(type: imageType){
        switch type {
        case .back:
            setSystemNameImage("chevron.left")
            setFrame()
        }
    }
}
