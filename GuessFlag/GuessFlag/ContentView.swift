//
//  ContentView.swift
//  GuessFlag
//
//  Created by Hui Yin Tsai on 2020/04/14.
//  Copyright © 2020 Hui Yin Tsai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctans = Int.random(in: 0...2)
    
    @State private var showscore = false
    @State private var ansmsg=""
    
    var body: some View {
        ZStack{
            VStack(spacing:30){
                VStack{
                    Text("Please select the right flag")
                    Text("\(countries[correctans])")
                }
                
                ForEach(0..<3){ number in
                    Button(action:{self.checkans(n:number)}){
                        Image(self.countries[number]).renderingMode(.original)
                    }
                }
                Spacer()
            }
        }
        .alert(isPresented:$showscore){
            Alert(title: Text(ansmsg), message: Text("your score : "),
                  dismissButton: .default(Text("Continue")){
                    self.nextquiz()
                })
        }
        
        
        }
    
    func checkans(n:Int){
        //check the answer
        if n==correctans{
            ansmsg="Correct!"
        }else{
            ansmsg="Oh..No."
        }
        showscore=true
    }
    
    func nextquiz(){
        showscore=false
        countries.shuffle()
        correctans=Int.random(in: 0...2)
    }
    
    }

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
