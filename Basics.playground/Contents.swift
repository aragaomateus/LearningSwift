import Foundation

//this is a variable
var name = "Mateus"

//this is a constant

let age = 24

let integer:Int = 100

let pi:Double = 3.14

let isSwiftFun: Bool = true

let greeting: String = "Hello, swift"

let sum = 1 + 2

let isGreater = sum > 2

let isTrue = !false
//
//var number = Int(readLine()!)!
let number: Int = 3
if number < 10{
    print("number is less than 10")
}else{
    print("number is 10 or greater")
}

for index in 1...3{
    print("index is \(index)")
}

let someCharacter: Character = "z"

switch someCharacter{
case  "a","e","i","o","u":
    print("vowel")
    
default:
    print("not vowel")
    
}
