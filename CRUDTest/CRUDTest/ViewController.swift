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
    
//        let ListTab: UIViewController = ListVC()
//        let WriteTab: UIViewController = WriteVC()
//        let tabList = [ListTab, WriteTab]
        
//        ListTab.title = "List"
//        WriteTab.title = "Write"
        
//        self.setViewControllers(tabList.map { UINavigationController(rootViewController: $0) }, animated: true)
        
        
    }
    
// 여백 터치 시 키보드 숨김
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?){
          self.view.endEditing(true)
    }
}
