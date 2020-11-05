//
//  TblCell.swift
//  CRUDTest
//
//  Created by 서주희 on 2020/11/06.
//

import UIKit

class TblCell: UITableViewCell {
    
    @IBOutlet weak var TblCellLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
