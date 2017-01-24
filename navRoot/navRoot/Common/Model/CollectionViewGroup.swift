//
//  CollectionViewGroup.swift
//  navRoot
//
//  Created by CarterChen on 16/4/10.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

class CollectionViewGroup: NSObject {

    /**
     *  组的头部标题
     */
    var headerTitle: String?
    
    /**
     *  组的尾部标题
     */
    var footerTitle: String?
    
    
    /**
     *  组的每一行数据模型
     */
    var  items: [CollectionViewItem]!
    
}
