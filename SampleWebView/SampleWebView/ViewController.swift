//
//  ViewController.swift
//  SampleWebView
//
//  Created by seojuhee on 2020/07/15.
//  Copyright © 2020 seojuhee. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var WebViewMain: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //1. url string
        //2. url > request
        //3. req > load
        
        let urlString = "https://www.google.com"
        if let url = URL(string: urlString) { //unwrap 옵셔널 바인딩
            let urlReq = URLRequest(url: url)
            self.WebViewMain.load(urlReq)
            
            print(CFGetRetainCount(WebViewMain))
        }
    }

}

