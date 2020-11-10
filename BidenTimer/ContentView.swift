//
//  ContentView.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/9/20.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Image("bg").resizable().edgesIgnoringSafeArea(.all)
            VStack{
                Image("seal").resizable().frame(width: 300, height: 300, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                Text("The next President of the United States in...").font(.largeTitle).multilineTextAlignment(.center).foregroundColor(.white)
                Spacer()
                Ticker()
                    .padding()
                    .foregroundColor(.black)
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
