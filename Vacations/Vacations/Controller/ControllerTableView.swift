//
//  ControllerTableView.swift
//  Vacations
//
//  Created by Bouziane Bey on 24/07/2019.
//  Copyright © 2019 Bouziane Bey. All rights reserved.
//

import UIKit

class ControllerTableView: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    
    var calanques: [Calanque] = []
    var cellId = "alternativeCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        calanques = CollectionCalanque().all()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return calanques.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let calanque = calanques[indexPath.row]
        if let cell = tableView.dequeueReusableCell(withIdentifier: "alternativeCell") as? CalanqueCellAlternative{
            cell.calanque = calanque
            return cell
        }
        return UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: segueID, sender: calanques[indexPath.row])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == segueID, let VC = segue.destination as? detailVC{
            VC.receivedCalanque = sender as? Calanque
        }
    }
}
