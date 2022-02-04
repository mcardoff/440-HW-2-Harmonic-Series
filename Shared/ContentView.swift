//
//  ContentView.swift
//  Shared
//
//  Created by Michael Cardiff on 2/3/22.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject private var calculator = Calculator()
    @State var maxTerms: String = "10"
    @State var sUpSum: String = ""
    @State var sDnSum: String = ""
    @State var relDiff: String = ""
    var body: some View {
        HStack(alignment: .center) {
            Text("N:")
                .font(.callout)
                .bold()
            TextField("Enter Max Terms", text: $maxTerms, onCommit: self.calculateSums)
                .frame(width: 100)
            
        }.padding()
        
        HStack {
            // Boxes that contain series values
            VStack {
                HStack {
                    Text("S(Up):")
                        .font(.callout)
                        .bold().frame(width: 50)
                    TextField("Up", text: $sUpSum).frame(width: 100)
                }.padding()
                
                HStack {
                    Text("S(Dn):")
                        .font(.callout)
                        .bold().frame(width: 50)
                    TextField("Down", text: $sDnSum).frame(width: 100)
                }.padding()
                            }
            // Errors wrt to S3
            VStack {
                HStack {
                    Text("Log Relative Diff:")
                        .font(.callout)
                        .bold().frame(width: 50)
                    TextField("Diff", text: $relDiff).frame(width: 100)
                }.padding()
            }
            
        }
        Button("Calculate Series", action: { self.calculateSums() } )
            .padding()
    }
    
    func calculateSums() {
        let sUpDouble = calculator.calculateFiniteSumUpWard(
            function: calculator.sumTerm(n:), minimum: 1, maximum: Int(maxTerms)!)
        let sDnDouble = calculator.calculateFiniteSumDnWard(
            function: calculator.sumTerm(n:), minimum: 1, maximum: Int(maxTerms)!)
        
        sUpSum = String(format: "%0.9f", sUpDouble)
        sDnSum = String(format: "%0.9f", sDnDouble)
        relDiff = String(format: "%0.9f",
                         log10(calculator.calcRelDifference(up: sUpDouble, down: sDnDouble)))
        return
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
