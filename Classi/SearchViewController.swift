//
//  SearchViewController.swift
//  Prototipo
//
//  Created by Andrea on 06/11/2018.
//  Copyright © 2018 Sergio Solmonte. All rights reserved.
//

import UIKit

class SearchViewController: UIViewController, UISearchBarDelegate,UITextViewDelegate,UITableViewDataSource {
    

    @IBOutlet var searchBar: UISearchBar!
    @IBOutlet var userTable: UITableView!
    
    var searchWord = [String]()
    let user = ["Pazkal","Agostino","Pietroppaolo","Felice","Camastra","Pierfrancesco"]
    var persona = [Persona]()
    var searchPersona = [Persona]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//        searchWord = user
        caricaDati()
        // Do any additional setup after loading the view.
    }
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        searchPersona = persona.filter({
            (el: Persona) -> Bool in
            if let text = searchBar.text {
                return el.nome.lowercased().contains(text.lowercased())
            }
            return false
        })
        userTable.reloadData()
    }
    
    func caricaDati(){
        do {
            if let file = Bundle.main.url(forResource: "User", withExtension: "json") {
                let data = try Data(contentsOf: file)
                self.persona = try JSONDecoder().decode([Persona].self, from: data)
                persona = persona.sorted(by: {$0.nome < $1.nome})
                
            }
            print("dati caricati")
        }catch {
            print("Error")
    }
    
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if searchPersona.isEmpty{
        return persona.count
        } else {
            return searchPersona.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellIdentifier="Cell"
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath)
        if searchPersona.isEmpty{
        cell.textLabel?.text=persona[indexPath.row].nome
        } else {
            cell.textLabel?.text=searchPersona[indexPath.row].nome
        }
        return cell
            
    }
    
    
    
//    override func tabl
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

