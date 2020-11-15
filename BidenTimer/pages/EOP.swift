//
//  EOP.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/15/20.
//

import SwiftUI

struct EOP: View {
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
            }.navigationTitle("Executive Offices of the President").onAppear {
            DBService().getProfiles(at: "president/staff"){ result in
                if let profiles = result {
                    self.profiles = profiles.sorted { $0.name < $1.name }
                }
            }
        }
    }
}

struct EOP_Previews: PreviewProvider {
    static var previews: some View {
        EOP()
    }
}
