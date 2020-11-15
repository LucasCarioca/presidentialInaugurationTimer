//
//  URLImage.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/15/20.
//

import SwiftUI
import Combine

struct URLImage: View {
    @StateObject private var loader: ImageLoader
    private let placeholder = Image("seal")

    init(url: URL) {
        _loader = StateObject(wrappedValue: ImageLoader(url: url))
    }

    var body: some View {
        Group {
            if loader.image != nil {
                Image(uiImage: loader.image!).resizable()
            } else {
                placeholder.resizable()
            }
        }.onAppear(perform: loader.load)
    }

    private var content: some View {
        placeholder
    }
}

class ImageLoader: ObservableObject {
    @Published var image: UIImage?
    private let url: URL

    init(url: URL) {
        self.url = url
    }

    deinit {
        cancel()
    }
    private var cancellable: AnyCancellable?

    func load() {
        cancellable = URLSession.shared.dataTaskPublisher(for: url)
            .map { UIImage(data: $0.data) }
            .replaceError(with: nil)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] in self?.image = $0 }
    }
    
    func cancel() {
        cancellable?.cancel()
    }
}

struct URLImage_Previews: PreviewProvider {
    static var previews: some View {
        URLImage(url: URL(string: "https://firebasestorage.googleapis.com/v0/b/presidentialinaugurationtimer.appspot.com/o/joe.jpg?alt=media&token=0209efca-da15-4034-8427-1c8331d79f99")!)
    }
}
