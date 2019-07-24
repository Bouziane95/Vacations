//
//  detailVC.swift
//  Vacations
//
//  Created by Bouziane Bey on 24/07/2019.
//  Copyright © 2019 Bouziane Bey. All rights reserved.
//

import UIKit

class detailVC: UIViewController {

    @IBOutlet weak var nameDesc: UITextView!
    @IBOutlet weak var calanqueImageView: UIImageView!
    
    var receivedCalanque: Calanque?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let calanque = receivedCalanque else {return}
        calanqueImageView.image = calanque.image
        let mutable = NSMutableAttributedString(string: calanque.name + "\n\n", attributes: [.foregroundColor: UIColor.red, .font: UIFont.boldSystemFont(ofSize: 20)])
        mutable.append(NSAttributedString(string: calanque.desc, attributes: [.font: UIFont.systemFont(ofSize: 17), .foregroundColor: UIColor.darkGray]))
        nameDesc.attributedText = mutable
        nameDesc.textAlignment = .center

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
