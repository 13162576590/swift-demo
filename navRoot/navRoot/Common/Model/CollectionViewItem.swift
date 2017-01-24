//
//  CollectionViewItem.swift
//  navRoot
//
//  Created by CarterChen on 16/4/10.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

class CollectionViewItem: NSObject {

    var icon: String!
    var title: String!
    
    /**
     * 控制器的类型
     */
    var vcClass: AnyClass?
    
    //单例
    static let shareCollectionViewItem = CollectionViewItem()
    
    
    func itemWithIcon(_ icon: String, title: String) -> CollectionViewItem {
        self.icon = icon
        self.title = title
        return self
    }
    
    class func itemWithIcon(_ icon: String, title: String)  -> CollectionViewItem {
        return CollectionViewItem().itemWithIcon(icon, title: title)
    }

    class func itemWithIcon(_ icon: String, title: String, vcClass: AnyClass) -> CollectionViewItem {
        let item: CollectionViewItem = self.itemWithIcon(icon, title: title)
        item.vcClass = vcClass
        return item
    }

    
    
}
