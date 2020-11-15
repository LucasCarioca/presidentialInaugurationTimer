//
//  BidenTimerApp.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/8/20.
//

import SwiftUI

@main
struct BidenTimerApp: App {
    @State var page: Int? = 0
    var body: some Scene {
        WindowGroup {
            NavigationView {
                Menu(page: $page)
                TickerPage()
            }
        }
    }
}
