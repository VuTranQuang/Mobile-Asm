//
//  ValuesCell.swift
//  Mobile-Asm
//
//  Created by tran.quang.vu on 23/02/2024.
//

import UIKit

class ValuesCell: UITableViewCell {
    
    @IBOutlet weak var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func setData(_ data: String) {
        self.valueLabel.text = data
    }
}
