//
//  ContentView.swift
//  WeSplit
//
//  Created by Hui Yin Tsai on 2020/04/22.
//  Copyright © 2020 Hui Yin Tsai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var amount=""
    @State private var numofpeople=2
    @State private var persentage=2
    let persentages = [10,20,30,40,50]
    var perperson:Double{
        let doubleamount=Double(amount) ?? 0
        let persentage1 = (Double(persentages[persentage])/100)+1
        let amount_all = Double(doubleamount * persentage1)
        let amount_per = amount_all/Double(numofpeople+2)
        return amount_per
    }
    
    var body: some View {
        NavigationView{
            Form{
                Section{
                    TextField("enter amount",text: $amount)
                    .keyboardType(.decimalPad)
                    
                    Picker("people",selection: $numofpeople ){
                        ForEach(2..<20){
                            Text("\($0) people")
                        }
                    }
                    
                    Picker("%",selection: $persentage){
                        ForEach(0..<persentages.count){
                            Text("\(self.persentages[$0])%")
                        }
                    }
                }
                Section{
                    Text("$\(perperson,specifier: "%.2f") per person")
                    Text("\(numofpeople+2) people")
                    Text("Persentage: \(self.persentages[persentage])%")
                }
                
            }
            .navigationBarTitle(Text("WeSplit"))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
