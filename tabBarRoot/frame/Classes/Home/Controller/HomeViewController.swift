//
//  HomeViewController.swift
//  frame
//
//  Created by CarterChen on 16/3/22.
//  Copyright © 2016年 CarterChen. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    lazy var tableView: UITableView = {
//        var tableView = UITableView(frame: CGRectMake(0, 64, self.view.bounds.width, self.view.bounds.height - 64), style: <#T##UITableViewStyle#>)
        
        var tableView = UITableView(frame: CGRect(x: 0, y: 0, width: self.view.bounds.width, height: self.view.bounds.height ))
        tableView.separatorStyle = UITableViewCellSeparatorStyle.none
        tableView.dataSource = self
        tableView.delegate = self
        return tableView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.view.backgroundColor = UIColor.red
        
        setUpNavgationBar()
        
        self.view.addSubview(self.tableView)
    }

    func setUpNavgationBar(){
//        self.navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItemWithImage(UIImage(named: "navigationbar_friendsearch"), highImage: UIImage(named: "navigationbar_friendsearch_highlighted"), target: self, action: #selector(HomeViewController.friendsearch), controlEvents: UIControlEvents.TouchUpInside)
        
         let bar = UIBarButtonItem.barButtonItemWithImage(UIImage(named: "navigationbar_friendsearch"), highImage: UIImage(named: "navigationbar_friendsearch_highlighted"), target: self, action: #selector(HomeViewController.friendsearch), controlEvents: UIControlEvents.touchUpInside)
        print(bar)
          print(bar)
         self.navigationItem.leftBarButtonItem = bar
    }
    
    func friendsearch(){
        let testVc:  TestViewController = TestViewController()
        self.navigationController?.pushViewController(testVc, animated: true)
    }
    
    /**
    *  tableViewDelegate方法
    */
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell:UITableViewCell = UITableViewCell(style: UITableViewCellStyle.subtitle, reuseIdentifier: nil)
        cell.textLabel!.text = "Cell text"
        cell.detailTextLabel?.text = "Cell Subtitle"
        cell.imageView!.image = UIImage(named:"compose_emoticonbutton_background_highlighted")
        return cell
    }
}


