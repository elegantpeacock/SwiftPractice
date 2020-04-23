import UIKit

var str = "Hello, playground"

func travel(action: (String) -> String) {
    print("I'm getting ready to go.")
    let description = action("London")
    print(description)
    print("I arrived!")
}
travel { 
    return "I'm head to \($0) in my car"
}
