//
//  ProfilePage.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/10/20.
//

import SwiftUI

struct ProfilePage: View {
    @State var name = ""
    @State var image: URL?
    @State var title = ""
    @State var source = ""
    var path: String
    var loadedProfile: Profile?
    
    init(path: String) {
        self.path = path
        self.loadedProfile = nil
    }
    
    init(profile: Profile) {
        self.path = ""
        self.loadedProfile = profile
    }
    
    var body: some View {
        ZStack {
            Image("bg").resizable().edgesIgnoringSafeArea(.all)
            VStack {
                if let image = self.image {
                    URLImage(url: image).frame(width: 300, height: 300).cornerRadius(150)
                }
                Spacer()
                Text(self.name)
                    .font(.largeTitle)
                    .foregroundColor(.black)
                Text(self.title)
                    .padding(.horizontal,25)
                    .multilineTextAlignment(.center)
                    .font(.headline)
                    .foregroundColor(.black)
                Text("source: \(self.source)")
                    .padding(.bottom, 50)
                    .foregroundColor(.black)
            }
        }.onAppear {
            if let profile = self.loadedProfile {
                print(profile)
                self.name = profile.name
                self.image = URL(string: profile.image)!
                self.title = profile.title
                self.source = profile.source
            } else {
                DBService().getProfile(at: self.path){ result in
                    if let profile = result {
                        print(profile)
                        self.name = profile.name
                        self.image = URL(string: profile.image)!
                        self.title = profile.title
                        self.source = profile.source
                    }
                }
            }
        }
    }
}
