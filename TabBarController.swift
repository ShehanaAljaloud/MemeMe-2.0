//
//  TabBarController.swift
//  MemeMe 1.0
//
//  Created by Shehana Aljaloud on 15/05/2019.
//  Copyright © 2019 Shehana Aljaloud. All rights reserved.
//


import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Make Unselected Icons A Different Color
        
        self.tabBar.unselectedItemTintColor = UIColor.black
    }
    
}
