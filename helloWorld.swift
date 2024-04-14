import Foundation

var optionalInteger: Int? = nil
optionalInteger = 42

if let actualInteger = optionalInteger{
    print("the integer is \(actualInteger)")
}else{
    print("the optional does not contain a value")
}
func greet(person:String) -> String{
    let greeting = "Hello,\(person)!"
    return greeting
}

print(greet(person:"Mateus"))