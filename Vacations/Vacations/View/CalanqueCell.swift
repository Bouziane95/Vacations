//
//  CalanqueCell.swift
//  Vacations
//
//  Created by Bouziane Bey on 24/07/2019.
//  Copyright © 2019 Bouziane Bey. All rights reserved.
//

import UIKit

class CalanqueCell: UITableViewCell {

    @IBOutlet weak var LblName: UILabel!
    @IBOutlet weak var calanqueImageView: ImgRound!
    @IBOutlet weak var containerView: UIView!
    
    var calanque: Calanque!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func setupCell(_ calanque: Calanque){
        self.calanque = calanque
        containerView.layer.cornerRadius = 20
        containerView.backgroundColor = #colorLiteral(red: 0.921431005, green: 0.9214526415, blue: 0.9214410186, alpha: 0.5)
        LblName.text = self.calanque.name
        calanqueImageView.image = self.calanque.image
    }

}
