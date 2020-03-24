//
//  loansTableViewCell.swift
//  KivaLoan
//
//  Created by 薛義郎 on 2020/3/24.
//  Copyright © 2020 薛義郎. All rights reserved.
//

import UIKit

class loansTableViewCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    @IBOutlet weak var country: UILabel!
    @IBOutlet weak var use: UILabel!
    @IBOutlet weak var amount: UILabel!
    
    
    var loanViewModel: LoansViewModel! {
        didSet {
            self.name.text = loanViewModel.name
            self.country.text = loanViewModel.country
            self.use.text = loanViewModel.use
            self.amount.text = String(loanViewModel.amount)
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
