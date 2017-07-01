//: Playground - noun: a place where people can play

import UIKit

func participacao(p1: Bool, p2: Bool, p3: Bool, p4: Bool, p5: Bool) -> String {
    var positivas: Int = 0
    var participacao: String
    if p1 == true {positivas += 1}
    if p2 == true {positivas += 1}
    if p3 == true {positivas += 1}
    if p4 == true {positivas += 1}
    if p5 == true {positivas += 1}
    switch positivas {
    case 2:
        participacao = "Suspeita"
    case 3:
        participacao = "Cumplice"
    case 4:
        participacao = "Cumplice"
    case 5:
        participacao = "Assassino"
    
    default:
        participacao = "Inocente"
    }
    return participacao;
}

var classificacao = participacao(p1: false, p2: true, p3: false, p4: false, p5: true)

print("Classificação da pessoa:", classificacao)







