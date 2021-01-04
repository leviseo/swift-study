//
//  thumbnailCell.swift
//  CRUDTest
//
//  Created by Levi on 2020/12/10.
//

import UIKit

class ThumbnailCell: UITableViewCell {
    
    var songImg: String?

    @IBOutlet weak var thumbNail: UIImageView!
    @IBOutlet weak var urlBtn: UIButton!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.thumbNail.layer.cornerRadius = self.thumbNail.frame.size.width / 2.5
        
    }
    
    // url 입력 버튼 클릭
    @IBAction func urlBtnClick(_ sender: Any) {
        
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
