//
//  ViewController.swift
//  Lab_02
//
//  Created by mobile on 27/05/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var txtResultado: UILabel!
    @IBOutlet weak var txtIdade: UITextField!

    @IBAction func calcularIdade(_ sender: Any) {
        if (txtIdade.text?.isEmpty)! {
            txtResultado.text = "Informe uma idade para calcular!"
            return
        }
        var idade: Int = Int(txtIdade.text!)!
        idade = idade * 7
        txtResultado.text = "A idade do cachorro é \(idade)!"
        txtIdade.text = ""
        ocultarTeclado()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override var prefersStatusBarHidden: Bool {
       return true;
    }
    
    func ocultarTeclado() {
        view.endEditing(true)
    }
}

