import Foundation

precedencegroup CompositionPrecedence {
    associativity: left
}

infix operator >>>: CompositionPrecedence

func >>> <T, U, V>(lhs: @escaping (T) -> U, rhs: @escaping (U) -> V) -> (T) -> V{
    return { rhs(lhs($0)) }
}

//example
func generateNumber(max: Int)->Int {
    let number = Int(arc4random_uniform(UInt32(max)))
    print(number)
    
    return number
}

func calculateFactors(number: Int) -> [Int] {
    return (1...number).filter { number % $0 == 0 }
}

func reduceToString(numbers: [Int]) -> String {
    return numbers.reduce("Factors: ") { $0 + String($1) + " " }
}

let combined = generateNumber >>> calculateFactors >>> reduceToString

print(combined(100))

