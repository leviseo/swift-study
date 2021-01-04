//
//  TextfieldCell.swift
//  CRUDTest
//
//  Created by Levi on 2020/12/10.
//

import UIKit

class TextfieldCell: UITableViewCell {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var textfield: UITextField!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
