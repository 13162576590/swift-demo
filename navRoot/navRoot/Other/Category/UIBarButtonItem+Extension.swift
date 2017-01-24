//
//  UIBarButtonItem+Extension.swift
//  frame
//
//  Created by CarterChen on 16/3/23.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    
    class func barButtonItemWithImage(_ image: UIImage?, highImage:UIImage?, target: AnyObject, action:Selector, controlEvents:UIControlEvents) ->UIBarButtonItem{
        let btn = UIButton(type: .custom)
        btn.setBackgroundImage(image, for: UIControlState())
        btn.setBackgroundImage(highImage, for: UIControlState.highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: controlEvents)
        return UIBarButtonItem(customView: btn)
    }
    
}
