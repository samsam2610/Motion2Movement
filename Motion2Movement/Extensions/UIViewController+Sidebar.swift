//
//  UIViewController+Sidebar.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 6/27/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import Foundation

extension UIViewController {
    func setUpSideBar() {
        if self.revealViewController() != nil {
            self.revealViewController().rearViewRevealWidth = self.view.frame.width - 64
            self.navigationItem.leftBarButtonItem = self.editButtonItem
            self.editButtonItem.image = UIImage(named: "menu")
            self.editButtonItem.target = self.revealViewController()
            self.editButtonItem.action = #selector(SWRevealViewController.revealToggle(_:))
            self.view.addGestureRecognizer(self.revealViewController().panGestureRecognizer())
        }
    }
}
