//
//  ContentView.swift
//  Day25Jyangken
//
//  Created by Hui Yin Tsai on 2020/04/28.
//  Copyright © 2020 Hui Yin Tsai. All rights reserved.
//

import SwiftUI

struct msgword:View{
    var resultnum:Int
    var body:some View{
        VStack{
            if resultnum==0{
                //fair msg
                Text("oh...the same...")
            }else if resultnum==1{
                //win msg
                Text("YOU WIN!!!")
            }else{
                //lose msg
                Text("YOU LOSE~")
            }
        }
    }
}


struct ContentView: View {
    
    private var alltypes = ["ROCK","SCISSORS","PAPER"]
    let alltypeimg = ["r.circle","scissors","hand.raised"]
    @State private var PCAttack = Int.random(in: 0...2)
    @State private var playerSelect = 0
    @State private var YouWin = 4 //0:fair,1:win,2:lose,4:initial
    
    var body: some View {
        NavigationView{
            ZStack{
                VStack(alignment: .leading,spacing:50){
                    Text("Please Select")
                    HStack{
                        ForEach(0..<alltypes.count){ num in
                            //button
                            Button(action:{self.chkwin(number:num)}){
                                //Text(self.alltypes[num])
                                Image(systemName: self.alltypeimg[num])
                                    .imageScale(.large)
                                }
                            .scaledToFit()
                            .padding()
                            .background(Color.purple)
                            .foregroundColor(.white)
                            .padding(10)
                            .border(Color.purple, width: 5)
                            .cornerRadius(40)
                    }
                   
                    }
                    if self.YouWin != 4{
                        //player
                        Image(systemName: self.alltypeimg[playerSelect])
                            .font(.system(size:100.0))
                            .foregroundColor(.purple)
                        //PC
                        Image(systemName: self.alltypeimg[PCAttack])
                            .font(.system(size:60.0))
                            .foregroundColor(.red)
                        msgword(resultnum:self.YouWin)
                    }
                }
                }
            .navigationBarTitle(Text("Lets Jyangken!!"))
        }
    }
    func chkwin(number:Int){
        //check the number(selected) and PCAttack
        PCAttack=Int.random(in: 0...2)
        playerSelect=number
        let result = number - PCAttack
        if result==0{
            //fair
            YouWin = 0
        }else if result == (-1) || result == 2 {
            //You win
            YouWin = 1
        }else{
            //you lose
            YouWin = 2
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
