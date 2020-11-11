//
//  ListCell.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/07.
//

import UIKit

class ListCell: UITableViewCell {
    
    @IBOutlet weak var thumbView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
//        let url = URL(string: "https://via.placeholder.com/150")
//        do {
//            let data = try Data(contentsOf: url!)
//            thumb.image = UIImage(data: data)
//        }
//        catch {
//
//        }
    }
    
}
