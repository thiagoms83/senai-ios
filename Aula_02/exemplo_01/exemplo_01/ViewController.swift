//
//  ViewController.swift
//  exemplo_01
//
//  Created by mobile on 24/06/17.
//  Copyright © 2017 mobile. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var txtNome: UITextField!

    @IBOutlet weak var txtAltura: UITextField!
    
    @IBOutlet weak var txtPeso: UITextField!
    
    
    @IBOutlet weak var swMasculino: UISwitch!
    
    @IBOutlet weak var swFeminino: UISwitch!
    @IBOutlet weak var btnVerificar: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        var tap: UITapGestureRecognizer
        tap = UITapGestureRecognizer ( target: self, action: #selector(ViewController.fecharTeclado))
        view.addGestureRecognizer(tap)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func verificarPeso() {
        let nome: String = txtNome.text!;
        
        if (txtAltura.text?.isEmpty)! && (txtPeso.text?.isEmpty)! {
            showMessage(msg: "Favor preencher os campos de peso ou altura!", callback: nil)
            return;

        }
        
        let altura: Float = Float(txtAltura.text!)!;
        let peso: Float = Float(txtPeso.text!)!;
        var pesoIdeal: Float = 0.0;
        
        if !swMasculino.isOn && !swFeminino.isOn {
            showMessage(msg: "Favor escolher o sexo!", callback: nil)
            return;
        }
        
        if swMasculino.isOn {
            pesoIdeal = (72.7 * altura) - 58.0
        } else {
            pesoIdeal = (62.1 * altura) - 44.7
        }
        var msg: String = "Voce \(nome) esta "
        if pesoIdeal == peso {
            msg += "no peso certo!"
        } else if pesoIdeal > peso {
            msg += "abaixo do peso!"
        } else {
            msg += "acima do peso!"
        }
        showMessage(msg: msg, callback:  {(ACTION: UIAlertAction!) in self.limparTela()})
    }
    
    func showMessage(msg: String, callback: ((UIAlertAction) -> Void)?) {
        let janela: UIAlertController;
        let btnOK: UIAlertAction;
        let btnCancelar: UIAlertAction;
        
        janela = UIAlertController (
            title: "Resultado",
            message: msg,
            preferredStyle: UIAlertControllerStyle.actionSheet
        );
        
        btnOK = UIAlertAction (
            title: "OK",
            style: UIAlertActionStyle.default,
            handler: callback
        )
        
        btnCancelar = UIAlertAction (
            title: "Cancelar",
            style: UIAlertActionStyle.default,
            handler: nil        );
        
        janela.addAction(btnOK);
        janela.addAction(btnCancelar);
        self.present(janela, animated: true, completion: nil);
    }
    
    @IBAction func fecharTeclado() {
        view.endEditing(true);
    }
    
    @IBAction func stateChange(sender: UISwitch) {
        if (sender.tag == 0) {
            swFeminino.setOn(false, animated: true)
        } else {
            swMasculino.setOn(false, animated: true)
        }
    }
    
    func limparTela() {
        txtNome.text = ""
        txtPeso.text = ""
        txtAltura.text = ""
        swMasculino.setOn(false, animated: true)
        swFeminino.setOn(false, animated: true)
        
    }


}

