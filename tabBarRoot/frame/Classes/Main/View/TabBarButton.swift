//
//  TabBarButton.swift
//  frame
//
//  Created by CarterChen on 16/3/22.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

class TabBarButton: UIButton {

    weak var _item: UITabBarItem!
    
    let ImageRidio: CGFloat = 0.7
    
//    var highlighted: Bool = false {
//        didSet {
//            setNeedsDisplay()
//        }
//    }
    
    lazy var badgeView: BadgeView  = {
        let badgeView = BadgeView(type:.custom)
        self.addSubview(badgeView)
        return badgeView
    }()

    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setTitleColor(UIColor.black, for: UIControlState())
        self.setTitleColor(UIColor.orange, for: UIControlState.selected)
        
        self.imageView?.contentMode = UIViewContentMode.center
    
        self.titleLabel?.textAlignment = NSTextAlignment.center;
        
        //font size
        self.titleLabel?.font = UIFont.systemFont(ofSize: 12)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    var item:UITabBarItem! {
        willSet{
            _item = newValue
        }
        
        didSet{
            self.observeValue(forKeyPath: nil, of: nil, change: nil, context: nil)
            item.addObserver(self, forKeyPath: "title", options: NSKeyValueObservingOptions.new, context: nil)
            item.addObserver(self, forKeyPath: "image", options: NSKeyValueObservingOptions.new, context: nil)
            item.addObserver(self, forKeyPath: "selectedImage", options: NSKeyValueObservingOptions.new, context: nil)
            item.addObserver(self, forKeyPath: "badgeValue", options: NSKeyValueObservingOptions.new, context: nil)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        self.setTitle(_item.title, for: UIControlState())
        self.setImage(_item.image, for: UIControlState())
        self.setImage(_item.selectedImage, for: UIControlState.selected)
        self.badgeView.badgeValue = _item.badgeValue;
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        //imageView
        let imageX:CGFloat = 0
        let imageY:CGFloat = 0
        let imageW:CGFloat = self.bounds.size.width
        let imageH:CGFloat = self.bounds.height * ImageRidio
        self.imageView?.frame = CGRect(x: imageX, y: imageY, width: imageW, height: imageH)
   
        //title
        let titleX:CGFloat = 0
        let titleY:CGFloat = imageH - 3
        let titleW:CGFloat = self.bounds.size.width
        let titleH:CGFloat = self.bounds.size.height - titleY
        self.titleLabel?.frame = CGRect(x: titleX, y: titleY, width: titleW, height: titleH)
        
        //badgeView
        self.badgeView.setX(self.width - self.badgeView.width - 10)
        self.badgeView.setY(0)
    }
}
