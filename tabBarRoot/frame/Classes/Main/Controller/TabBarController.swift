//
//  TabBarController.swift
//  frame
//
//  Created by CarterChen on 16/3/22.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController, TabBarDelegate {
    
    weak var homeVc: HomeViewController!
    weak var messageVc: MessageViewController!
    weak var discoverVc: DiscoverViewController!
    weak var profileVc: ProfileViewController!

     lazy  var items:[UITabBarItem] = {
        return []
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        //添加所有的子控件
         setUpAllChildViewController()
        
        setUpTabBar()
        
        requestUnread()
    }
    
    func requestUnread(){
        // 设置首页未读数
        self.homeVc.tabBarItem.badgeValue = "1"
        
        // 设置消息未读数
        self.messageVc.tabBarItem.badgeValue = "0"
        
        // 设置我的未读数
        self.profileVc.tabBarItem.badgeValue = "2"
    }

    func setUpTabBar(){
        let tabBar = TabBar(frame: self.tabBar.bounds)
        tabBar.delegate = self;
        tabBar.items = self.items as NSArray!
        self.tabBar.addSubview(tabBar)
    }
    
    func setUpAllChildViewController() {
        // 首页
        let homeVc = HomeViewController()
        setUpOneChildViewController(homeVc, image: UIImage(named: "tabbar_home"), selectedImage: UIImage.imageWithOriginalName("tabbar_home_selected"), title: "首页")
        self.homeVc = homeVc
        
        // 消息
        let messageVc = MessageViewController()
       setUpOneChildViewController(messageVc, image: UIImage(named: "tabbar_message_center"), selectedImage:UIImage.imageWithOriginalName( "tabbar_message_center_selected"), title: "消息")
        self.messageVc = messageVc
        
        // 发现
        let discoverVc = DiscoverViewController()
       setUpOneChildViewController(discoverVc, image: UIImage(named: "tabbar_discover"), selectedImage:UIImage.imageWithOriginalName("tabbar_discover_selected"), title: "发现")
        self.discoverVc = discoverVc
        
        // 我
        let profileVc = ProfileViewController()
       setUpOneChildViewController(profileVc, image: UIImage(named: "tabbar_profile"), selectedImage:UIImage.imageWithOriginalName("tabbar_profile_selected"), title: "我")
        self.profileVc = profileVc
    }

    //添加一个子控件
    func setUpOneChildViewController(_ vc: UIViewController, image: UIImage!, selectedImage:UIImage, title:String)
        {
            vc.title = title
            vc.tabBarItem.image = image
            vc.tabBarItem.selectedImage = selectedImage
            self.items.append(vc.tabBarItem)
            
            //navigation
            let nav=NavigationController(rootViewController:vc)
            self.addChildViewController(nav)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // 移除系统自动产生的UITabBarButton
        for child in self.tabBar.subviews {
            if (!child.isKind(of: TabBar.self)) {
                child.removeFromSuperview()
            }
        }
    }
    
    //TabBarDelegate
    func tabBar(_ tabBar:TabBar, didClickButtonIndex:Int){
        
        if (didClickButtonIndex == 0 && self.selectedIndex == didClickButtonIndex) {
            
        }
        self.selectedIndex = didClickButtonIndex;
    }

    func tabBar(_ tabBar: TabBar) {
        print("点击➕")
    }
}
