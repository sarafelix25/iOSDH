//
//  CustomCell.swift
//  ex_tableViewProgramador
//
//  Created by sara.batista.d.felix on 24/09/21.
//

import UIKit

class CustomCell: UITableViewCell {

    @IBOutlet weak var imageCell: UIImageView!
    @IBOutlet weak var labelCell: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
