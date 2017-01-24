//
//  NSString+Extension.swift
//  frame
//
//  Created by Apple on 16/3/22.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

extension NSString {
    
    /**
     *  获取字符串的宽度和高度
     *
     *  @param text:NSString
     *  @param font:UIFont
     *
     *  @return CGRect
     */
    class func getTextRectSize(_ text:NSString,font:UIFont,size:CGSize) -> CGRect {
        let attributes = [NSFontAttributeName: font]
        let option = NSStringDrawingOptions.usesLineFragmentOrigin
        let rect:CGRect = text.boundingRect(with: size, options: option, attributes: attributes, context: nil)
        return rect;
    }

}
