//
//  ViewController.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/08.
//

import UIKit

class ViewController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
    
        let ListTab: UIViewController = ListVC()
        let WriteTab: UIViewController = WriteVC()
        let tabList = [ListTab, WriteTab]
        
        self.setViewControllers(tabList.map { UINavigationController(rootViewController: $0) }, animated: true)
    }
}
