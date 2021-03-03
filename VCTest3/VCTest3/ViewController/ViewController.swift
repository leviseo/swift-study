//
//  ViewController.swift
//  CRUDTest
//
//  Created by Levi on 2020/11/02.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var btn: UIButton!
    @IBOutlet weak var btnTable: UIButton!
    @IBOutlet weak var btnTblView: UIButton!
    @IBOutlet weak var btnCollapse: UIButton!
    @IBOutlet weak var btnTest: UIButton!
    @IBOutlet weak var btnScroll: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        print("ViewController viewDidLoad")
    }
    
    @IBAction func clickBtn(_ sender: Any) {
        pushView()
    }
    
    @IBAction func clickBtnTable(_ sender: Any) {
        pushTableView()
    }
    
    @IBAction func clickBtnTblView(_ sender: Any) {
        pushTblView()
    }
    
    @IBAction func clickBtnCollapse(_ sender: Any) {
        pushCollapse()
    }
    @IBAction func clickBtnTest(_ sender: Any) {
        pushAddSubViewTest()
    }
    
    @IBAction func clickBtnScroll(_ sender: Any) {
        pushScroll()
    }
    
    func pushView() {
        let vc = CollectionVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushTableView() {
        let vc = TableVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushTblView() {
        let vc = TblView()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushCollapse() {
        let vc = CollapseVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func pushAddSubViewTest() {
        let vc = AddSubViewTestVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }

    func pushScroll() {
        let vc = ScrollVC()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
//    view life cycle
    override func viewWillAppear(_ animated: Bool) {
        print("ViewController viewWillAppear")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        print("ViewController viewDidAppear")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        print("ViewController viewWillDisappear")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        print("ViewController viewDidDisappear")
    }
    
    deinit {
        print("ViewController deinit")
    }
    

}

