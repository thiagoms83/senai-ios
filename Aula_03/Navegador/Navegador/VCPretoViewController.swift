//
//  VCPretoViewController.swift
//  Navegador
//
//  Created by mobile on 01/07/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class VCPretoViewController: UIViewController {

    @IBOutlet weak var nomeIn: UITextField!
    var nome: String!
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vcBranco = segue.destination as! VCBranco
        vcBranco.nome = nomeIn.text
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nomeIn.text = nome
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
