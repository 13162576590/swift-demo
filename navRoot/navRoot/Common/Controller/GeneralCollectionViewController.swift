//
//  GeneralCollectionViewController.swift
//  navRoot
//
//  Created by CarterChen on 16/4/13.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

class GeneralCollectionViewController: BaseCollectionViewController {

//    private let reuseIdentifier = "CollectionViewCell"

    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "test"
        
        self.view.backgroundColor = UIColor.gray
        
        let group1: CollectionViewGroup = CollectionViewGroup()
        
        let item1: CollectionViewItem = CollectionViewItem.itemWithIcon("img_01", title: "img_01", vcClass: TestViewController.self)
        let item2: CollectionViewItem = CollectionViewItem.itemWithIcon("img_2", title: "img_02", vcClass: MessageViewController.self)
        let item3: CollectionViewItem = CollectionViewItem.itemWithIcon("img_03", title: "img_03", vcClass: Test3ViewController.self)
        let item4: CollectionViewItem = CollectionViewItem.itemWithIcon("img_04", title: "img_04", vcClass: Test4ViewController.self)
        group1.items = [item1, item2, item3, item4]
        
        self.cellData.append(group1)
    }


}
