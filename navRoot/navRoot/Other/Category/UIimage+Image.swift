//
//  UIimage+Image.swift
//  frame
//
//  Created by CarterChen on 16/3/22.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

extension UIImage {
    
    class func imageWithOriginalName(_ imageName: String) ->UIImage
    {
        let image = UIImage(named:  imageName)!.withRenderingMode(UIImageRenderingMode.alwaysOriginal)
        return image
    }
}
