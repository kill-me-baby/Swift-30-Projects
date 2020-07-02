//
//  ViewController.swift
//  GoodAsOldPhones
//
//  Created by Uladzislau Volchyk on 7/2/20.
//  Copyright © 2020 Uladzislau Volchyk. All rights reserved.
//

import UIKit

class ViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let vc1 = ContactViewController()
        vc1.tabBarItem = UITabBarItem(title: "Us", image: UIImage.init(systemName: "person"), selectedImage: UIImage.init(systemName: "person.fill"))
        
        let vc2 = UINavigationController(rootViewController:ProductsTableViewController())
        vc2.tabBarItem = UITabBarItem(title: "Products", image: UIImage.init(systemName: "cart"), selectedImage: UIImage.init(systemName: "cart.fill"))
        
        self.viewControllers = [vc2, vc1]
        self.selectedIndex = 0
    }
}

