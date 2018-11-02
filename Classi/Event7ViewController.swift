//
//  Event7ViewController.swift
//  Prototipo
//
//  Created by Sergio Solmonte on 01/11/18.
//  Copyright © 2018 Sergio Solmonte. All rights reserved.
//

import UIKit

class Event7ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
    
{
    
    @IBOutlet weak var tabella: UITableView!
    
    
    let campi7 = ["basket","calcio","tennis","pallavolo"]
    let campiImage7 = ["basket1","soccer","tennis1","volley"]
    let N_eventi7 = ["Partita di Event7","partita di andrea","Partita di zi rafel", "partita di mario"]
    let Event_Date7 = ["10:00","12:30","15:00","21:00"]
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //rorroorrororo
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return campi7.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80.0
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = "Cell"
        
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TableViewCell2
        
        //        cell..text = campi[indexPath.row]
        cell.Name_E7.text = N_eventi7[indexPath.row]
        cell.Image_E7.image = UIImage(named: campiImage7[indexPath.row])
        cell.type_E7.text = campi7[indexPath.row]
        cell.ora_E7.text = Event_Date7[indexPath.row]
        return cell
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        tabella.separatorInset = UIEdgeInsets(top: 15.0, left: 0.0, bottom: 15.0, right: 0.0)
    }
    
    
    /*  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     if segue.identifier == "toDetails" {
     if let indexPath = tabella.indexPathForSelectedRow {
     let destination = segue.destination as! ViewControllerDetails
     destination.nome = campi[indexPath.row]
     }
     
     }
     
     }
     
     */
}