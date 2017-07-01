//
//  ViewController.swift
//  exercicio04
//
//  Created by mobile on 24/06/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtResultado: UILabel!
    
    @IBOutlet weak var btnAcao02: UIButton!
    @IBOutlet weak var btnAcao01: UIButton!
    
    
    @IBAction func handleEvent(sender: UIButton) {
        let identificador: String = sender.currentTitle!;
        let texto: String = "\(identificador), foi clicado!"
        txtResultado.text = texto;
    }
    
    @IBAction func handleEvent01() {
        let texto: String = "Botao 01, foi clicado!"
        txtResultado.text = texto;
    }
    
    @IBAction func handleEvent02() {
        let texto: String = "Botao 02, foi clicado!"
        txtResultado.text = texto;
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

