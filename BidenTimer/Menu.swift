//
//  Menu.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/10/20.
//

import SwiftUI
    
struct Menu: View {
    @Binding var page: Int?
    var body: some View {
        List {
            Section(header: Text("Tools")){
                NavigationLink(destination: TickerPage(), tag: 0, selection: $page) {
                    Text("Countdown timer")
                }
            }
            Section(header: Text("Administration")){
                NavigationLink(destination: ProfilePage(path: "president/profile"), tag: 1, selection: $page) {
                    Text("President Elect")
                }
                NavigationLink(destination: ProfilePage(path: "vice-president/profile"), tag: 2, selection: $page) {
                    Text("Vice President Elect")
                }
                NavigationLink(destination: EOP(), tag: 3, selection: $page) {
                    Text("Executive Offices of the President")
                }
                NavigationLink(destination: CVTaskForce(), tag: 4, selection: $page) {
                    Text("Corona virus task force")
                }
                NavigationLink(destination: Cabinet(), tag: 5, selection: $page) {
                    Text("Cabinet picks")
                }
            }
            
        }.navigationTitle("Menu").listStyle(GroupedListStyle())
    }
}
