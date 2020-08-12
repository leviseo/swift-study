//
//  ViewController.swift
//  leviTable
//
//  Created by seojuhee on 2020/07/17.
//  Copyright © 2020 seojuhee. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var TableViewMain: UITableView!
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 몇개? 숫자
        return 30
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // 무엇? 반복 10번?
        // 1. 임의의 셀 만들기
        // 2. 스토디보드 + id
        
        let cell = UITableViewCell.init(style: .default, reuseIdentifier: "TableCellType1")
       
        cell.textLabel?.text = "\(indexPath.row)"
        return cell
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        TableViewMain.delegate = self
        TableViewMain.dataSource = self
    }

    //tableView - 전화번호부
    // 1. 데이터 무엇? - 전화번호부 목록
    // 2. 데이터 몇개? - 100, 1000, 10000
    // 3. (옵션) 데이터 행 눌렀다! - 클릭

}

