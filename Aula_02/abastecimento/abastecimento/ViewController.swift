//
//  ViewController.swift
//  abastecimento
//
//  Created by mobile on 24/06/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtGasolina: UITextField!
    
    @IBOutlet weak var alcool: UITextField!
    
    @IBOutlet weak var txtResposta: UILabel!
    
    @IBAction func actVerificar(_ sender: UIButton) {
        if (!(txtGasolina.text?.isEmpty)! && !(alcool.text?.isEmpty)!) {
        let gasolina: Float = Float(txtGasolina.text!)!;
        let pAlcool: Float = Float(alcool.text!)!;
            if (gasolina <= 0.0) {
                txtResposta.text = "Valor de gasolina nao pode ser zero ou negativo!";
                return;
            }
            if (pAlcool <= 0.0) {
            txtResposta.text = "Valor do alcool nao pode ser zero ou negativo!";
            return;
        }
        let comparacao: Float = pAlcool / gasolina;
        if (comparacao < 0.7) {
            txtResposta.text = "Abasteça com Álcool";
            txtResposta.textColor = UIColor.green;
        } else {
            txtResposta.text = "Abasteça com Gasolina";
            txtResposta.textColor = UIColor.red;
        }
        } else {
            txtResposta.text = "Valores nao podem ser vazios";
            txtResposta.textColor = UIColor.black;
        }
       
        view.endEditing(true);
        
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

