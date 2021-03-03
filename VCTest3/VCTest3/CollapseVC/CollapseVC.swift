//
//  CollapseVC.swift
//  VCTest3
//
//  Created by Levi on 2021/02/09.
//

import UIKit

class CollapseVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    let tableViewData = [
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
        ["1","2","3","4","5"],
    ]
    
    var hiddenSections = Set<Int>()
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }
    
    // =======================================
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.tableViewData.count
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 1
        if self.hiddenSections.contains(section) {
            return 0
        }
        
        // 2
        return self.tableViewData[section].count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        cell.textLabel?.text = self.tableViewData[indexPath.section][indexPath.row]
            
        return cell
    }
    
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        // 1
        let sectionButton = UIButton()
        
        // 2
        sectionButton.setTitle(String(section),
                               for: .normal)
        
        // 3
        sectionButton.backgroundColor = .systemBlue
        
        // 4
        sectionButton.tag = section
        
        // 5
        sectionButton.addTarget(self,
                                action: #selector(self.hideSection(sender:)),
                                for: .touchUpInside)

        return sectionButton
    }
    
    @objc
    private func hideSection(sender: UIButton) {
        // Create section let
        let section = sender.tag
        // Add indexPathsForSection method
        func indexPathsForSection() -> [IndexPath] {
            var indexPaths = [IndexPath]()
            
            for row in 0..<self.tableViewData[section].count {
                indexPaths.append(IndexPath(row: row,
                                            section: section))
            }
            
            return indexPaths
        }
        // Logic to add/remove sections to/from hiddenSections, and delete and insert functionality for tableView
        if self.hiddenSections.contains(section) {
            self.hiddenSections.remove(section)
            self.tableView.insertRows(at: indexPathsForSection(),
                                      with: .fade)
        } else {
            self.hiddenSections.insert(section)
            self.tableView.deleteRows(at: indexPathsForSection(),
                                      with: .fade)
        }
    }

}
