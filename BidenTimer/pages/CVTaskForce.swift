//
//  CVTaskForce.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/10/20.
//

import SwiftUI

struct CVTaskForce: View {
    @State var profiles = [Profile]()
    
    var body: some View {
        VStack {
            profiles.count > 0 ?
            List {
                ForEach(self.profiles, id: \.self) { profile in
                    NavigationLink(destination: ProfilePage(profile: profile)){
                        Text(profile.name)
                    }
                }
            } : nil
            profiles.count == 0 ? Text("Not yet announced").font(.title) : nil
        }.navigationTitle("Covid 19 Task Force").onAppear {
            DBService().getProfiles(at: "president/cvtf"){ result in
                if let profiles = result {
                    self.profiles = profiles.sorted { $0.name < $1.name }
                }
            }
        }
    }
}

struct CVTaskForce_Previews: PreviewProvider {
    static var previews: some View {
        CVTaskForce()
    }
}
