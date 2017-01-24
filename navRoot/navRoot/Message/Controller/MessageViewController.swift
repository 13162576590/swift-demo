//
//  MessageViewController.swift
//  frame
//
//  Created by CarterChen on 16/3/22.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

class MessageViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    fileprivate let reuseIdentifier: String! = "CollectionViewCell"

    let collections = [
        ["icon":"img_01", "title":"微微"],
        ["icon":"img_02", "title":"记忆中"],
        ["icon":"img_03", "title":"剩得漫"],
        ["icon":"img_04", "title":"神秘"],
        ["icon":"img_05", "title":"我朝"],
        ["icon":"img_01", "title":"微微一"],
        ["icon":"img_02", "title":"记忆中的"],
        ["icon":"img_03", "title":"剩得"],
        ["icon":"img_04", "title":"神秘"],
        ["icon":"img_05", "title":"我朝人"]
    ]
    
    lazy var collectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        let width = self.view.width / 4
        let height = width
        layout.itemSize = CGSize(width: width, height: height)
        //水平间隔
        layout.minimumInteritemSpacing = 0
        //垂直行间距
        layout.minimumLineSpacing = 0
        layout.sectionInset = UIEdgeInsetsMake(0, 0, 0,  0)
        
        var collectionView: UICollectionView = UICollectionView(frame: self.view.bounds, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        
        // Register cell classes
        collectionView.register(UINib(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: self.reuseIdentifier)
        
        return collectionView
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.green
        
        self.setUpNavgationBar()
        self.view.addSubview(self.collectionView)
    }


    func setUpNavgationBar(){
        self.navigationItem.rightBarButtonItem = UIBarButtonItem.barButtonItemWithImage(UIImage(named: "navigationbar_friendsearch"), highImage: UIImage(named: "navigationbar_friendsearch_highlighted"), target: self, action: #selector(MessageViewController.friendsearch), controlEvents: UIControlEvents.touchUpInside)
    }
    
    func friendsearch() {
        
    }
    
    //组数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return self.collections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView .dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier!, for: indexPath) as! CollectionViewCell
        let dict = self.collections[indexPath.item]
        cell.iconImageView.image = UIImage(named: dict["icon"]!)
        cell.titleLable.text = dict["title"]
        return cell
    }

}
