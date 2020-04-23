//
//  ContentView.swift
//  ChallengeDay19
//
//  Created by Hui Yin Tsai on 2020/04/22.
//  Copyright © 2020 Hui Yin Tsai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let moneys=["JPY","TWD","USD"]
    let currentrate:[Double]=[1,4,100]
    @State private var money1=0
    @State private var money2=0
    @State private var amount=""
    var result:Double{
        let amount_d=Double(amount) ?? 0
        let result_d = amount_d * currentrate[money1] / currentrate[money2]
        return result_d
    }

    var body: some View {
        NavigationView{
            Form{
                Section{
                    Picker("FROM",selection: $money1){
                        ForEach(0..<moneys.count){
                            Text("\(self.moneys[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    Picker("TO",selection: $money2){
                        ForEach(0..<moneys.count){
                            Text("\(self.moneys[$0])")
                        }
                    }.pickerStyle(SegmentedPickerStyle())
                    TextField("enter the amount",text: $amount)
                }
                Section{
                    Text("\(amount) \(moneys[money1]) = ")
                    Text("   \(result,specifier:"%.4f") \(moneys[money2])")
                }
            }
            .navigationBarTitle(Text("Exchange Rate"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
