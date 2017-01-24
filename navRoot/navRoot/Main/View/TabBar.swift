//
//  TabBar.swift
//  frame
//
//  Created by CarterChen on 16/3/22.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

//定义一个协议
protocol TabBarDelegate:NSObjectProtocol {
    func tabBar(_ tabBar:TabBar, didClickButtonIndex:Int)
    func tabBar(_ tabBar:TabBar)
}

class TabBar: UIView {

    var delegate:TabBarDelegate?
    
    weak var selectedButton: UIButton?
    
    lazy  var buttons:[TabBarButton] = {
        return []
    }()
    
    lazy var plusButton: UIButton = {

        var plusButton = UIButton(type:.custom)
        
        plusButton.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControlState())
        plusButton.setImage(UIImage(named: "tabbar_compose_background_icon_add"), for: UIControlState.highlighted)
        
        plusButton.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControlState())
        plusButton.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: UIControlState.highlighted)
        plusButton.sizeToFit()

        // 监听按钮的点击
        plusButton.addTarget(self,action:#selector(TabBar.plusClick),for:.touchUpInside)

        self.addSubview(plusButton)
        return plusButton
    }()
    
    func plusClick(){
        if delegate != nil {
            delegate?.tabBar(self)
        }
    }
    
    var items: NSArray! {
        willSet{
            self.items = newValue as? [UITabBarItem] as NSArray!
        }
        
        didSet{
            for item in self.items! {
                let btn: TabBarButton = TabBarButton(type:.custom)
                btn.item = item as! UITabBarItem
                btn.tag = self.buttons.count
                
                btn.addTarget(self, action: #selector(TabBar.btnClick(_:)), for: .touchDown)
                
                if btn.tag == 0{
                    btnClick(btn)
                }
                self.addSubview(btn)
                self.buttons.append(btn)
            }
        }
    }
    
    func btnClick(_ button:TabBarButton){
        self.selectedButton?.isSelected = false
        button.isSelected = true
        self.selectedButton = button
        
        if delegate != nil {
            delegate?.tabBar(self, didClickButtonIndex: button.tag)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let w = self.bounds.size.width
        let h = self.bounds.size.height
        var btnX: CGFloat = 0
        let btnY: CGFloat = 0
        let btnW: CGFloat = CGFloat(w / CGFloat(self.items.count + 1))
        let btnH: CGFloat = self.bounds.size.height
        
        var i = 0
        for tabBarButton in self.buttons {
            if i == 2 {
                i = 3
            }
            btnX = CGFloat(i) * btnW
            tabBarButton.frame = CGRect(x: btnX, y: btnY, width: btnW, height: btnH)
            i += 1
        }
        self.plusButton.center = CGPoint(x: w * 0.5, y: h * 0.5)
    }
}
