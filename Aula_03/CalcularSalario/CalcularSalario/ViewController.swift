//
//  ViewController.swift
//  CalcularSalario
//
//  Created by mobile on 01/07/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtValorHora: UITextField!
    @IBOutlet weak var txtHorasTrabalhadas: UITextField!
    
    
    open override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let salarioView = segue.destination as! SalarioViewController
        salarioView.valorHora = Float(txtValorHora.text!)!
        salarioView.horasTrabalhadas = Float(txtHorasTrabalhadas.text!)!
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

