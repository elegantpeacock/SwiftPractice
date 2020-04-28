//
//  ContentView.swift
//  Day25Practice
//
//  Created by Hui Yin Tsai on 2020/04/28.
//  Copyright © 2020 Hui Yin Tsai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State private var agreeA=false
    @State private var agreeB=false
    @State private var agreeC=false
    
    struct style1:ViewModifier{
        func body(content:Content) -> some View {
            content
                .foregroundColor(Color.red)
        }
    }
    
    struct wordB:View{
        var agreeBB:Bool=false
        var body:some View{
            VStack{
                if agreeBB{
                    Text("agree B").modifier(style1())
                }else{
                    Text("agree B")
                }
            }
        }
    }
    
    var body: some View {
        
        let agreeAll=Binding<Bool>(
            get:{
                self.agreeA && self.agreeB && self.agreeC
            },
            set:{
                self.agreeA = $0
                self.agreeB = $0
                self.agreeC = $0
            }
        )
        return VStack(spacing:20){
            Text("Hello, World!")
            Toggle(isOn: $agreeA){
                Text("agree A")
                if agreeA{
                    Text("A on").modifier(style1())
                }
            }
            Toggle(isOn: $agreeB){
                wordB(agreeBB: agreeB)
            }
            Toggle(isOn: $agreeC){
                Text("agree C")
            }
            Toggle(isOn: agreeAll){
                Text("agree All")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
