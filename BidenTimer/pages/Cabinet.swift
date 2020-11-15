//
//  Cabinet.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/15/20.
//

import SwiftUI

struct Cabinet: View {
    @State var profiles = [Profile]()
    
    var body: some View {
        VStack {
            profiles.count > 0 ?
            List {
                ForEach(self.profiles, id: \.self) { profile in
                    NavigationLink(destination: ProfilePage(profile: profile)){
                        Text(profile.title)
                    }
                }
            } : nil
            profiles.count == 0 ? Text("Not yet announced").font(.title) : nil
        }.navigationTitle("Cabinet").onAppear {
            DBService().getProfiles(at: "president/cabinet"){ result in
                if let profiles = result {
                    self.profiles = profiles.sorted { $0.name < $1.name }
                }
            }
        }
    }
}

struct Cabinet_Previews: PreviewProvider {
    static var previews: some View {
        Cabinet()
    }
}
