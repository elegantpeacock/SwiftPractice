//
//  ContentView.swift
//  ViewsandModifiers
//
//  Created by Hui Yin Tsai on 2020/04/23.
//  Copyright © 2020 Hui Yin Tsai. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("Hello World")
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

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
