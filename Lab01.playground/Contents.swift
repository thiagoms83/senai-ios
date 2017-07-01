//: Playground - noun: a place where people can play

import UIKit

func menor(a: Float, b: Float, c: Float) -> Float {
    var menor = a
    if b < menor {menor = b}
    if c < menor {menor = c}
    return menor
}

var resultado = menor(a: 10, b: 30, c: 5);
print("O menor valor é", resultado)

