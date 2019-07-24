//
//  ImgRound.swift
//  Vacations
//
//  Created by Bouziane Bey on 24/07/2019.
//  Copyright © 2019 Bouziane Bey. All rights reserved.
//

import UIKit

class ImgRound: UIImageView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        setup()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setup()
    }
    
    func setup(){
        layer.cornerRadius = frame.height / 2
        layer.borderColor = UIColor.white.cgColor
        layer.borderWidth = 2
        clipsToBounds = true
        contentMode = .scaleAspectFill
    }
    

}
