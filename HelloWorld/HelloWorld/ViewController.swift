//
//  ViewController.swift
//  HelloWorld
//
//  Created by seojuhee on 2020/07/10.
//  Copyright © 2020 seojuhee. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBAction func Click_moveBtn(_ sender: Any) {
        //storyboad find coltroller : DetailController
        //옵셔널 바인딩
        if let controller = self.storyboard?.instantiateViewController(withIdentifier: "DetailController") {
            //move controller
            self.navigationController?.pushViewController(controller, animated: true)
        }
        
        
        //move controller
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
}

