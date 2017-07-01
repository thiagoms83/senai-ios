//
//  SalarioViewController.swift
//  CalcularSalario
//
//  Created by mobile on 01/07/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class SalarioViewController: UIViewController {

    var valorHora: Float = 0.0
    var horasTrabalhadas: Float = 0.0
    
    @IBOutlet weak var txtINSS: UITextField!
    @IBOutlet weak var labelINSS: UILabel!
    @IBOutlet weak var txtSalarioLiquido: UITextField!
    @IBOutlet weak var txtTotalDescontos: UITextField!
    @IBOutlet weak var txtFGTS: UITextField!
    @IBOutlet weak var labelFGTS: UILabel!
    @IBOutlet weak var txtIR: UITextField!
    @IBOutlet weak var labelIR: UILabel!
    @IBOutlet weak var txtSalarioBruto: UITextField!
    @IBOutlet weak var labelSalarioBruto: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        labelSalarioBruto.text = "Salário Bruto ( \(valorHora) x \(horasTrabalhadas) ):"
        let salario: Float = valorHora * horasTrabalhadas
        txtSalarioBruto.text = String(salario)
        
        var taxaIR: Float = 0.0
        if (salario > 900.0 && salario <= 1500.0) {taxaIR = 0.05}
        if (salario > 1500.0 && salario <= 2500.0) {taxaIR = 0.1}
        if (salario > 2500.0) {taxaIR = 0.2}
        
        labelIR.text = "(- IR) (\(taxaIR * 100)%):"
        let descontoIR: Float = salario * taxaIR
        txtIR.text = String(descontoIR)
        
        let taxaINSS: Float = 0.1
        let descontoINSS: Float = salario * taxaINSS
        labelINSS.text = "(-) INSS (\(taxaINSS * 100)%)"
        txtINSS.text = String(descontoINSS)
        
        let taxaFGTS: Float = 0.11
        let descontoFGTS: Float = salario * taxaFGTS
        labelFGTS.text = "FGTS (\(taxaFGTS * 100)%)"
        txtFGTS.text = String(descontoFGTS)
        
        let totalDescontos: Float = descontoIR + descontoINSS + descontoFGTS
        txtTotalDescontos.text = String(totalDescontos)
        txtSalarioLiquido.text = String(salario - totalDescontos)
        
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
