//
//  ViewController.swift
//  exercicio_corretor
//
//  Created by mobile on 01/07/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var txtNome: UITextField!
    @IBOutlet weak var txtVendas: UITextField!
    @IBOutlet weak var tableComissoes: UITableView!
    
    @IBOutlet weak var txtTotal: UILabel!
    var nomes = [String]();
    var vendas = [Float]();
    
    @IBAction func addComissao() {
        if (txtNome.text?.isEmpty)! || (txtVendas.text?.isEmpty)! {
            return
        }
        let nome: String = txtNome.text!
        let venda: Float = Float(txtVendas.text!)!
        
        nomes.append(nome)
        vendas.append(venda)
        txtNome.text = ""
        txtVendas.text = ""
        txtNome.resignFirstResponder()
        txtVendas.resignFirstResponder()
        tableComissoes.reloadData()
        configurarTotal()
    }
    
    func configurarTotal() {
        var total: Float = 0.0
        var i = 0
        while i < vendas.count {
            let venda: Float = vendas[i]
            total = total + venda;
            i += 1
        }
        
        
        txtTotal.text = "Total de comissões R$ \(total)"
        
    }
    
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nomes.count
    }
    
    
    func configurarConteudoCelula(idCelula: UITableViewCell, index: IndexPath) {
        let nome: String = nomes[index.row]
        let venda: Float = vendas[index.row]
        let comissao: String = "\(nome) obteve R$ \(venda)."
        idCelula.textLabel?.text = comissao
    }
    
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celula = tableView.dequeueReusableCell(withIdentifier: "celulaID", for: indexPath) as UITableViewCell
        configurarConteudoCelula(idCelula: celula, index: indexPath)
        return celula
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            nomes.remove(at: indexPath.row)
            vendas.remove(at: indexPath.row)
            tableComissoes.deleteRows(at: [indexPath], with: .automatic)
            configurarTotal()
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        configurarTotal()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

