//
//  UIImageViewExtension.swift
//  iOSEngineerCodeCheck
//
//  Created by 小西俊輔 on 2021/02/13.
//  Copyright © 2021 YUMEMI Inc. All rights reserved.
//

import UIKit

extension UIImageView {
    func toCircle() {
        layer.masksToBounds = false
        layer.cornerRadius = frame.width/2
        clipsToBounds = true
    }
}
