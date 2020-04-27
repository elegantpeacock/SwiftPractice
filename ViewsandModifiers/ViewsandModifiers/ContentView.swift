//
//  ContentView.swift
//  ViewsandModifiers
//
//  Created by Hui Yin Tsai on 2020/04/23.
//  Copyright © 2020 Hui Yin Tsai. All rights reserved.
//

import SwiftUI

struct blueice:View{ //View composition
    var text:String
    
    var body:some View{
        Text(text)
        .padding()
        .background(Color.red)
        .padding()
        .background(Color.blue)
        .padding()
        .background(Color.green)
        .padding()
        .background(Color.yellow)
    }
}

//custom modifier
struct style1:ViewModifier{
    func body(content:Content) -> some View {
        content
        .padding()
        .background(Color.yellow)
        .padding()
        .background(Color.green)
        .padding()
        .background(Color.blue)
        .padding()
        .background(Color.red)
    }
}

//custom container
struct stackgrid<Content: View>:View{
    let row:Int
    let column:Int
    let content:(Int,Int)->Content
    
    var body:some View{
        VStack{
            ForEach(0..<row , id: \.self){ rr in
                HStack{
                    ForEach(0..<self.column , id: \.self){ cc in
                        self.content(rr,cc)
                    }
                }
            }
        }
    }
}
 

struct ContentView: View {
    let motto1 = Text("textmotto1")
    var motto2:some View { Text("texmotto2").modifier(style1()) }
    
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia", "Spain", "UK", "US"].shuffled()
    @State private var correctans = Int.random(in: 0...2)
    
    @State private var showscore = false
    @State private var ansmsg=""
    
    
    var body: some View {
        ZStack{
            VStack(spacing:20){
                VStack{
                    Text("Please select the right flag")
                    Text("\(countries[correctans])")
                }
                /*motto1.foregroundColor(Color.red)
                motto2.modifier(style1())
                Text("Hello World")
                blueice(text:"BLUEICE")
                
                stackgrid(row: 3, column: 4 ){ rrr, ccc in
                    HStack{
                        Image(systemName: "\(rrr * 4 + ccc).circle")
                        Text("\(rrr),\(ccc)")
                    }
                }*/
                ForEach(0..<3){ nn in
                    Button(action:{self.chkans(number: nn)}){
                        //image
                        Image(self.countries[nn]).renderingMode(.original)
                    }.modifier(style1())
                    Spacer()
                }
            }
            .background(Color.red)
        }
        .alert(isPresented:$showscore){
            Alert(title: Text(ansmsg), message: Text("your score : "),
                  dismissButton: .default(Text("Continue")){
                    self.nextquiz()
                })
        }
        
    }
    func chkans(number:Int){
            //check the answer
            if number==correctans{
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
