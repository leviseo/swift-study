//
//  TestVC.swift
//  VCTest3
//
//  Created by Levi on 2021/02/19.
//

import UIKit

class AddSubViewTestVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        testButton()
    }

    func testButton() {
        let stackView = UIStackView(frame: CGRect(x: 0, y: self.view.frame.height - 50, width: self.view.frame.width, height: 50))
        let prevBtn = UIButton(frame: CGRect(x: 0, y: 0, width: self.view.frame.width / 2, height: 50))
        stackView.backgroundColor = .blue
        prevBtn.backgroundColor = .brown
        self.view.addSubview(stackView)
        stackView.addSubview(prevBtn)
    }

}
