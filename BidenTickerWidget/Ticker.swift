//
//  ContentView.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/8/20.
//

import SwiftUI

struct Ticker: View {
    
    @State var nowDate: Date = Date()
    var timer: Timer {
        Timer.scheduledTimer(withTimeInterval: 1, repeats: true) {_ in
            self.nowDate = Date()
        }
    }
    
    var body: some View {
        VStack {
            Text(days())
                .font(.largeTitle)
                .foregroundColor(.black)
            Text(hours())
                .font(.largeTitle)
                .foregroundColor(.black)
            Text(minutes())
                .font(.largeTitle)
                .foregroundColor(.black)
            Text(seconds())
                .font(.largeTitle)
                .foregroundColor(.black)
        }.onAppear(perform: {
            _ = self.timer
        })
    }

    
    func breakDownDate() -> DateComponents {
        let calendar = Calendar(identifier: .gregorian)
        return calendar
            .dateComponents([.day, .hour, .minute, .second],
                            from: nowDate,
                            to: Date(timeIntervalSince1970: 1611122400))
    }
    
    func days() -> String {
        let components = breakDownDate()
        return String(format: "%02d Days",
                      components.day ?? 00)
    }
    
    func hours() -> String {
        let components = breakDownDate()
        return String(format: "%02d Hours",
                      components.hour ?? 00)
    }
    
    func minutes() -> String {
        let components = breakDownDate()
        return String(format: "%02d Minutes",
                      components.minute ?? 00)
    }
    
    func seconds() -> String {
        let components = breakDownDate()
        return String(format: "%02d Seconds",
                      components.second ?? 00)
    }

}

struct Ticker_Previews: PreviewProvider {
    static var previews: some View {
        Ticker()
    }
}
