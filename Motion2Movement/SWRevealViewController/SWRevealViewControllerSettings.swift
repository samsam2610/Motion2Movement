//
//  SWRevealViewControllerSettings.swift
//  Motion2Movement
//
//  Created by Victor Zhong on 6/27/18.
//  Copyright © 2018 Victor Zhong. All rights reserved.
//

import Foundation

struct SWRevealViewControllerSettings {
    static func setUpSideBar(_ viewController: UIViewController) {
        if viewController.revealViewController() != nil {
            viewController.revealViewController().rearViewRevealWidth = viewController.view.frame.width - 64
            viewController.navigationItem.leftBarButtonItem = viewController.editButtonItem
            viewController.editButtonItem.image = UIImage(named: "menu")
            viewController.editButtonItem.target = viewController.revealViewController()
            viewController.editButtonItem.action = #selector(SWRevealViewController.revealToggle(_:))
            viewController.view.addGestureRecognizer(viewController.revealViewController().panGestureRecognizer())
        }
    }
}
