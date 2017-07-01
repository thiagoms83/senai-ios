//
//  ViewController.swift
//  exemplo03
//
//  Created by mobile on 24/06/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var textNome: UITextField!
    
    @IBOutlet weak var tableNomes: UITableView!
    
    var arrayNomes = [String]()
    
    
    @IBAction func addNome() {
        if (textNome.text?.isEmpty)! {
            return
        }
        
        arrayNomes.append(textNome.text!)
        textNome.text = ""
        textNome.resignFirstResponder()
        tableNomes.reloadData()
    }
    
    
   
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayNomes.count
    }
    
    
    func configurarConteudoCelula(idCelula: UITableViewCell, index: IndexPath) {
        idCelula.textLabel?.text = arrayNomes[index.row]
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaID", for: indexPath) as UITableViewCell
        configurarConteudoCelula(idCelula: celula, index: indexPath)
        return celula
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            arrayNomes.remove(at: indexPath.row)
            tableNomes.deleteRows(at: [indexPath], with: .automatic)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

