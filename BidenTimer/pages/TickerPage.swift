//
//  ContentView.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/9/20.
//

import SwiftUI

struct TickerPage: View {
    var body: some View {
        ZStack{
            Image("bg").resizable().edgesIgnoringSafeArea(.all)
            VStack{
                Image("seal").resizable().frame(width: 300, height: 300, alignment: .center)
                Text("The next President of the United States in...").font(.largeTitle).multilineTextAlignment(.center).foregroundColor(.white)
                Spacer()
                Ticker()
                    .padding()
                    .foregroundColor(.black)
            }
        }
    }
}

struct TickerPage_Previews: PreviewProvider {
    static var previews: some View {
        TickerPage()
    }
}
