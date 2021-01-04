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
        self.thumbView.layer.cornerRadius = self.thumbView.frame.size.width / 2.5
    }
    
}
