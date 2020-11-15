//
//  Router.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/10/20.
//

import SwiftUI

struct Router: View {
    
    @Binding var page: Int
    var body: some View {
        Text("\(page)")
    }
}
