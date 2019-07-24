//
//  CalanqueCellAlternativeTableViewCell.swift
//  Vacations
//
//  Created by Bouziane Bey on 24/07/2019.
//  Copyright © 2019 Bouziane Bey. All rights reserved.
//

import UIKit

class CalanqueCellAlternative: UITableViewCell {
    
    @IBOutlet weak var calanqueImageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    var calanque: Calanque?{
        didSet{
            if calanque != nil {
                calanqueImageView.image = calanque!.image
                lblName.text = calanque!.name
            }
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
