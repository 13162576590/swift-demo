//
//  NavigationController.swift
//  frame
//
//  Created by CarterChen on 16/3/22.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

class NavigationController: UINavigationController {
    
    override class func initialize(){
        let item: UIBarButtonItem = UIBarButtonItem.appearance()
        item.tintColor = UIColor.orange
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }


    override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        if  self.childViewControllers.count != 0 {
            viewController.hidesBottomBarWhenPushed = true
            let left: UIBarButtonItem = UIBarButtonItem.barButtonItemWithImage(UIImage(named: "navigationbar_back"), highImage: UIImage(named: "navigationbar_back_highlighted"), target: self, action: #selector(NavigationController.popToPre), controlEvents: UIControlEvents.touchUpInside)
            // 设置导航条的按钮
            viewController.navigationItem.leftBarButtonItem = left;
            
//            let right: UIBarButtonItem = UIBarButtonItem.barButtonItemWithImage(UIImage(named: "navigationbar_more"), highImage: UIImage(named: "navigationbar_more_highlighted"), target: self, action: Selector("popToRoot"), controlEvents: UIControlEvents.TouchUpInside)
//            // 设置导航条的按钮
//            viewController.navigationItem.rightBarButtonItem = right;
        }
        
        super.pushViewController(viewController, animated: animated)
    }
    
    func popToPre(){
        self.popViewController(animated: true)
    }
    
    func popToRoot(){
        self.popToRootViewController(animated: true)
    }

}
