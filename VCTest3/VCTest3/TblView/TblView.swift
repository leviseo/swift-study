//
//  TblView.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/06.
//

import UIKit

class TblView: UIViewController , UITableViewDelegate, UITableViewDataSource{
    
    @IBOutlet var table: UITableView!
    
    var cellID = String.init(describing: TblCell.self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        let nib = UINib(nibName: cellID, bundle: nil)
        self.table.register(nib, forCellReuseIdentifier: cellID)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! TblCell
        cell.TblCellLabel.text = "\(indexPath.row)"
        return cell
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    //    view life cycle
        override func viewWillAppear(_ animated: Bool) {
            print("TblView viewWillAppear")
        }
        
        override func viewDidAppear(_ animated: Bool) {
            print("TblView viewDidAppear")
        }
        
        override func viewWillDisappear(_ animated: Bool) {
            print("TblView viewWillDisappear")
        }
        
        override func viewDidDisappear(_ animated: Bool) {
            print("TblView viewDidDisappear")
        }
        
        deinit {
            print("TblView deinit")
        }

}
