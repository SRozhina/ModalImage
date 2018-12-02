//
//  UIImageView extensions.swift
//  ModalImage
//
//  Created by Sofia on 02/12/2018.
//

import UIKit

extension UIImageView {
    var originalFrame: CGRect? {
        get {
            return self.superview?.convert(self.frame, to: nil)
        }
        set { }
    }
}
