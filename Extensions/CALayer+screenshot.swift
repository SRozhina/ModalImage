//
//  CALayer+screenshot.swift
//  ModalImage
//
//  Created by Sofia on 24/11/2018.
//  Copyright © 2018 Sofia. All rights reserved.
//

import Foundation

public extension CALayer {
    public var screenShot: UIImage? {
        let scale = UIScreen.main.scale
        UIGraphicsBeginImageContextWithOptions(frame.size, false, scale)
        if let context = UIGraphicsGetCurrentContext() {
            render(in: context)
            let screenshot = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return screenshot
        }
        return nil
    }
}
