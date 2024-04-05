//
//  BalanceTableViewCell.swift
//  Splitwise
//
//  Created by Akash Tiwari on 05/04/24.
//

import UIKit

class BalanceTableViewCell: UITableViewCell {

    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAmount: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
}
