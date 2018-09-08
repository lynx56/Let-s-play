import Foundation

public class Stack<T>: CustomDebugStringConvertible{
    public var debugDescription: String{
        return disks.debugDescription
    }
    
    private var disks: [T] = []
    
    public var length: Int{
        return disks.count
    }
    
    public init(){
        
    }
    
    public convenience init(_ array: [T]) {
        self.init()
        array.forEach { push($0) }
    }
    
    public func pop()->T?{
        if disks.isEmpty{
            return nil
        }
        let last = disks.removeLast()
        return last
    }
    
    public func push(_ element: T){
        disks.append(element)
    }
    
    public func look()->T?{
        if disks.isEmpty{
            return nil
        }
        return disks.last
    }
}
