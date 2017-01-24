//
//  BaseCollectionViewController.swift
//  navRoot
//
//  Created by CarterChen on 16/4/10.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit


class BaseCollectionViewController: UICollectionViewController {

    fileprivate let reuseIdentifier = "CollectionViewCell"

    
    /**
     *  表格数据，里面存储Group
     */
    lazy var cellData: [CollectionViewGroup] = {
        var cellData: [CollectionViewGroup] =  [CollectionViewGroup]()
        return cellData
    }()
    
    

    override init(collectionViewLayout layout: UICollectionViewLayout) {
        super.init(collectionViewLayout: layout)
        
//        let layout = UICollectionViewLayout()
        //let layout = UICollectionViewFlowLayout()
        
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        
        self.collectionView = UICollectionView(
            frame: CGRect(x: 0,y: 20,width: view.bounds.size.width,height: view.bounds.height-20),
            collectionViewLayout:layout)
        
        // Register cell classes
        self.collectionView?.register(UINib(nibName: self.reuseIdentifier, bundle: nil), forCellWithReuseIdentifier: self.reuseIdentifier)
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
//        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = UIColor.brown

    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return self.cellData.count
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        //组数据
        let group = self.cellData[section]
        return group.items.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell: CollectionViewCell = collectionView.dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier, for: indexPath) as! CollectionViewCell
    
        let group = self.cellData[indexPath.section]
        let item: CollectionViewItem = group.items[indexPath.row]
        
        //设置模型 显示数据
//        cell.item = item
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let group = self.cellData[indexPath.section]
        let item = group.items[indexPath.item]
        
        let vc = (item.vcClass?.alloc())! as! UIViewController
        print(item.vcClass)
//        let vc = TestViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(collectionView: UICollectionView, shouldHighlightItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(collectionView: UICollectionView, shouldSelectItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(collectionView: UICollectionView, shouldShowMenuForItemAtIndexPath indexPath: NSIndexPath) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, canPerformAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) -> Bool {
        return false
    }

    override func collectionView(collectionView: UICollectionView, performAction action: Selector, forItemAtIndexPath indexPath: NSIndexPath, withSender sender: AnyObject?) {
    
    }
    */
 
    

}
