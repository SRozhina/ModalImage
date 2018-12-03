//
//  UIImage+cropRatio.swift
//  ModalImage_Example
//
//  Created by Sofia on 03/12/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import UIKit

extension UIImage {
    var cropRatio: CGFloat { return self.size.width / self.size.height }
}
