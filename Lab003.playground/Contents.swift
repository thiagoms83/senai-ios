//: Playground - noun: a place where people can play

import UIKit

func farenheitToCelsius(farenheit: Float) -> Float {
    var celsius: Float
    celsius = 5 * ( farenheit - 32 ) / 9
    return celsius
}

var tempFarenheit: Float = 100
var tempCelsius: Float
tempCelsius = farenheitToCelsius(farenheit: tempFarenheit)

print(tempFarenheit, "em Farenheit corresponde a", tempCelsius, "em Celsius")