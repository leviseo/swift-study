//
//  MainVC.swift
//  SampleWebView
//
//  Created by Levi on 2021/03/10.
//  Copyright © 2021 seojuhee. All rights reserved.
//

import UIKit
import WebKit

class MainVC: UIViewController, WKUIDelegate {

    lazy var webView: WKWebView = {
        let webConfiguration = WKWebViewConfiguration()
        let webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.translatesAutoresizingMaskIntoConstraints = false
        return webView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()

        let url = URL(string: "https://www.google.com")
        let request = URLRequest(url: url!)
        webView.load(request)
    }
    
    func setupUI() {
        self.view.addSubview(webView)

        NSLayoutConstraint.activate([
            self.webView.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
            self.webView.rightAnchor.constraint(equalTo: self.view.rightAnchor),
            self.webView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
            self.webView.leftAnchor.constraint(equalTo: self.view.leftAnchor)
        ])
    }

}
