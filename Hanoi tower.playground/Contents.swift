import UIKit
import Foundation
import PlaygroundSupport

struct Tower<T>: CustomDebugStringConvertible{
    var name = ""
    var disks = Stack<T>()
    
    var debugDescription: String{
        return "Tower: \(name) = \(disks.debugDescription)"
    }
}


func moveDisk<T>(diskCount: Int, source: inout Tower<T>, destination: inout Tower<T>, aux: inout Tower<T>) where T: Comparable{
    guard diskCount > 0
        else { return }
    
    moveDisk(diskCount: diskCount - 1, source: &source, destination: &aux, aux: &destination)

    let movingDisk = source.disks.pop()!

    if let headDestination = destination.disks.look(), movingDisk > headDestination{
        fatalError()
    }
    
    destination.disks.push(movingDisk)
    
    moveDisk(diskCount: diskCount - 1, source: &aux, destination: &destination, aux: &source)
}

//generate disks with length from 10 cm to 100 cm. Sort by length desc
let disks = stride(from: 10, to: 100, by: 10).map{ Measurement<UnitLength>(value: $0, unit: .centimeters) }.sorted(by: {$0 > $1})

var towerA = Tower(name: "A", disks: Stack(disks))
var towerB = Tower(name: "B", disks: Stack<Measurement<UnitLength>>())
var towerC = Tower(name: "C", disks: Stack<Measurement<UnitLength>>())

moveDisk(diskCount: towerA.disks.length, source: &towerA, destination: &towerB, aux: &towerC)

print(towerA.debugDescription)
print(towerB.debugDescription)
print(towerC.debugDescription)

