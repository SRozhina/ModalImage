//
//  Background.swift
//  ModalImage
//
//  Created by Sofia on 22/01/2019.
//

import UIKit

public struct Background {
    public var color: UIColor = .black
    public var alpha: CGFloat = 0.6
    public var blur: Bool = false
    
    public init(color: UIColor = .black, alpha: CGFloat = 0.6, blur: Bool = false) {
        self.color = color
        self.alpha = alpha
        self.blur = blur
    }
}
