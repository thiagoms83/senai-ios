//
//  ViewController.swift
//  Lab_03
//
//  Created by mobile on 27/05/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtTemperatura: UITextField!
    
    
    @IBAction func actionConverter(_ sender: Any) {
        if (txtTemperatura.text?.isEmpty)! {
            txtTemperatura.text = "Informe uma temperatura!"
            return
        }
        let celsius: Float = Float(txtTemperatura.text!)!
        let farenheit: Float = celsius * 1.8 + 32
        txtTemperatura.text = "\(celsius)° Celsius equivale a \(farenheit)° Farenheit"
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
    
    func ocultarTeclado() {
        view.endEditing(true)
    }


}

