//
//  TestViewController.swift
//  frame
//
//  Created by CarterChen on 16/3/23.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

class TestViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {
    
    fileprivate let reuseIdentifier: String! = "AdvertisingCell"
    fileprivate let advertisingMaxSections = 100
    fileprivate var timer: Timer? = nil

    
    let advertising = [
            ["icon":"img_01", "title":"微微一笑，很是倾城，顾漫作品"],
            ["icon":"img_02", "title":"记忆中的东京爱情故事"],
            ["icon":"img_03", "title":"剩得漫不经心，却又可歌可泣"],
            ["icon":"img_04", "title":"神秘空难事故揭秘"],
            ["icon":"img_05", "title":"我朝人民都需要治愈，莫弃疗"]
    ]
    
    lazy var collectionView : UICollectionView = {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: self.view.width, height: 200)
        layout.minimumLineSpacing = 0;
        layout.scrollDirection = UICollectionViewScrollDirection.horizontal;

        var collectionView: UICollectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: self.view.width, height: 200), collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.clear
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.showsHorizontalScrollIndicator = false
        collectionView.isPagingEnabled = true

        // 默认显示最中间的那组
        collectionView.scrollToItem(at: IndexPath.init(item: 0, section: Int(self.advertisingMaxSections / 2)) , at: UICollectionViewScrollPosition.left, animated: false)
        
        // Register cell classes
        collectionView.register(UINib(nibName: "AdvertisingCell", bundle: nil), forCellWithReuseIdentifier: self.reuseIdentifier)
        
        return collectionView
    }()

    lazy var pageContol : UIPageControl = {
        let pageContol: UIPageControl = UIPageControl()
        pageContol.numberOfPages = self.advertising.count
        pageContol.frame = CGRect(x: 200, y: 160, width: 100, height: 37)
        pageContol.currentPageIndicatorTintColor = UIColor.red
        pageContol.pageIndicatorTintColor = UIColor.blue
        return pageContol
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.title = "无限滚动"
        
        self.view.backgroundColor = UIColor.purple
        self.view.addSubview(self.collectionView)
        self.view.addSubview(self.pageContol)
        
        // 添加定时器
        self.addTimer()
    }
    
    /**
     *  添加定时器
     */
    func addTimer() {
        let timer = Timer.scheduledTimer(timeInterval: 2.0, target: self, selector: #selector(TestViewController.nextPage), userInfo: nil, repeats: true)
        RunLoop.main.add(timer, forMode: RunLoopMode.commonModes)
        self.timer = timer
    }
    
    /**
     *  移除定时器
     */
    func removeTimer() {
         // 停止定时器
        self.timer?.invalidate()
        self.timer = nil
    }
    
    /**
     *  下一页
     */
    func nextPage() {
        // 1.马上显示回最中间那组的数据
        let currentIndexPathReset: IndexPath = self.resetIndexPath()
        
        // 2.计算出下一个需要展示的位置
        var nextItem = currentIndexPathReset.item + 1
        var nextSection = currentIndexPathReset.section
        if (nextItem == self.advertising.count) {
            nextItem = 0
            nextSection += 1
        }
        
        let nextIndexPath: IndexPath = IndexPath.init(item: nextItem, section: nextSection)
        
        // 3.通过动画滚动到下一个位置
        self.collectionView.scrollToItem(at: nextIndexPath, at: UICollectionViewScrollPosition.left, animated: true)
    }
    
    func resetIndexPath() -> IndexPath {
        // 当前正在展示的位置
        let currentIndexPath: IndexPath = self.collectionView.indexPathsForVisibleItems.last!
        // 马上显示回最中间那组的数据
        let currentIndexPathReset: IndexPath = IndexPath.init(item: currentIndexPath.item, section: Int(self.advertisingMaxSections / 2))
        
        self.collectionView.scrollToItem(at: currentIndexPathReset, at: UICollectionViewScrollPosition.left, animated: false)
        
        return currentIndexPathReset;
    }
    
    //组数
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return advertisingMaxSections
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {

        return self.advertising.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
          let cell: AdvertisingCell = collectionView .dequeueReusableCell(withReuseIdentifier: self.reuseIdentifier!, for: indexPath) as! AdvertisingCell
        
        let dict = self.advertising[indexPath.item]
        cell.iconImageView.image = UIImage(named: dict["icon"]!)
        cell.titleLabel.text = dict["title"]
        return cell
    }
    
    //MARK  - UICollectionViewDelegate
    /**
     *  当用户即将开始拖拽的时候就调用
     */
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        self.removeTimer()
    }
    
    /**
     *  当用户停止拖拽的时候就调用
     */
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        self.addTimer()
    }
 
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        
        let page = Int((scrollView.contentOffset.x / scrollView.bounds.size.width + 0.5)) % self.advertising.count
        self.pageContol.currentPage = page
    }


}
