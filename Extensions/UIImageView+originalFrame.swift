//
//  UIImageView extensions.swift
//  ModalImage
//
//  Created by Sofia on 02/12/2018.
//

import Foundation

extension UIImageView {
    var originalFrame: CGRect? {
        get {
            let parentViewController = findParentViewController(self)
            return self.superview?.convert(self.frame, to: parentViewController?.view)
        }
        set { }
    }
    
    private func findParentViewController(_ view: UIView) -> UIViewController? {
        var parentResponder: UIResponder? = self
        while parentResponder != nil {
            parentResponder = parentResponder!.next
            if let viewController = parentResponder as? UIViewController {
                return viewController
            }
        }
        return nil
    }
}
