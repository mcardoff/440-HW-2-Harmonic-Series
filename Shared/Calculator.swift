//
//  Calculator.swift
//  HW 2 Harmonic Series
//
//  Created by Michael Cardiff on 2/3/22.
//

import Foundation
import SwiftUI

typealias returnsDouble = (_ parameters: Int) -> Double

class Calculator: ObservableObject {
    
    /// calculateFiniteSum
    /// Calculate the following sum:
    //        max
    //        ___
    // sum =  \    f(n)
    //        /__
    //      n = min
    func calculateFiniteSumUpWard(function: returnsDouble, minimum: Int, maximum: Int) -> Double {
        
        var sum = 0.0
        
        for n in minimum...maximum {
            sum += function(n)
        }
        
        return sum
    }
    
    func calculateFiniteSumDnWard(function: returnsDouble, minimum: Int, maximum: Int) -> Double {
        
        var sum = 0.0
        
        for n in (minimum...maximum).reversed() {
            sum += function(n)
        }
        
        return sum
    }
    
    func sumTerm(n: Int) -> Double {
        return 1.0 / Double(n)
    }
    
    func calcErr(actual: Double, calculated: Double) -> Double {
        return abs(actual - calculated) / actual
    }
    
    func calcRelDifference(up: Double, down: Double) -> Double {
        return abs(up - down) / (abs(up) + abs(down))
    }
}
