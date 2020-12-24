//
//  UIView+KBExtension.swift
//  KBChat
//
//  Created by 周昊 on 2020/12/24.
//

import Foundation

extension UIView {
    
    var x: CGFloat {
        set {
            let tempFrame = CGRect.init(x: newValue, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
            frame = tempFrame
        }
        get {
            return frame.origin.x
        }
    }
    
    var y: CGFloat {
        set {
            let tempFrame = CGRect.init(x: frame.origin.x, y: newValue, width: frame.size.width, height: frame.size.height)
            frame = tempFrame
        }
        get {
            return frame.origin.y
        }
    }
    
    var width: CGFloat {
        set {
            let tempFrame = CGRect.init(x: frame.origin.x, y: frame.origin.y, width: newValue, height: frame.size.height)
            frame = tempFrame
        }
        get {
            return frame.size.width
        }
    }
    
    var height: CGFloat {
        set {
            let tempFrame = CGRect.init(x: frame.origin.x, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
            frame = tempFrame
        }
        get {
            return frame.size.height
        }
    }
}
