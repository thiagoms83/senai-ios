//
//  ViewController.swift
//  Lab01
//
//  Created by mobile on 01/07/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgFigura: UIImageView!
    @IBAction func alterarCor(_ sender: UIButton) {
        var nome: String
        switch sender.tag {
        case 0:
            nome = "amarelo.png"
        case 1:
            nome = "azul.png"
        case 2:
            nome = "verde.png"
        case 3:
            nome = "vermelho.png"
        default:
            nome = "amarelo.png"
        }
        
        
        imgFigura.image = UIImage(named: nome)
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

