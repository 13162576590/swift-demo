//
//  BadgeView.swift
//  frame
//
//  Created by Apple on 16/3/22.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

class BadgeView: UIButton {

    let BadgeViewFont:CGFloat = 11

    var badgeValue: String? {
        willSet{
            self.badgeValue = newValue
        }
        
        didSet{
        
            if self.badgeValue != nil {
                if(self.badgeValue!.characters.count == 0 || self.badgeValue == "0"){
                    self.isHidden = true
                    return
                }else{
                    self.isHidden = false
                }
            
                let rect = NSString.getTextRectSize(self.badgeValue! as NSString, font:UIFont.systemFont(ofSize: BadgeViewFont), size: CGSize(width: UIScreen.main.bounds.width, height: self.frame.height))
                if rect.width > self.width {
                    self.setImage(UIImage(named:"new_dot" ), for: UIControlState())
                    self.setTitle(nil, for: UIControlState())
                    self.setBackgroundImage(nil, for: UIControlState())
                }else{
                    self.setImage(nil, for: UIControlState())
                    self.setTitle(self.badgeValue, for: UIControlState())
                    self.setBackgroundImage(UIImage(named:"main_badge" ), for: UIControlState())
                }
            } else {
                self.isHidden = true
                return
            }
            
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)

        self.isUserInteractionEnabled = false
        self.setBackgroundImage(UIImage(named: "main_badge"), for: UIControlState())
        self.titleLabel?.font = UIFont.systemFont(ofSize: BadgeViewFont)
        self.sizeToFit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
}
