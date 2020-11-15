//
//  DBService.swift
//  BidenTimer
//
//  Created by Lucas Desouza on 11/15/20.
//

import Foundation

class DBService {
    private let baseUrl = "https://presidentialinaugurationtimer.firebaseio.com/"
    
    private func getFullUrl(path: String) -> URL {
        print("\(baseUrl)\(path).json")
        return URL(string: "\(baseUrl)\(path).json")!
    }
    
    func getProfile(at path: String, then completion: @escaping (Profile?) -> ()) {
        URLSession.shared.dataTask(with: getFullUrl(path: path)) {
            data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let profile = try? JSONDecoder().decode(Profile.self, from: data)
            DispatchQueue.main.async {
                completion(profile)
            }
        }.resume()
    }
    
    func getProfiles(at path: String, then completion: @escaping ([Profile]?) -> ()) {
        URLSession.shared.dataTask(with: getFullUrl(path: path)) {
            data, response, error in
            guard let data = data, error == nil else {
                DispatchQueue.main.async {
                    completion(nil)
                }
                return
            }
            let profile = try? JSONDecoder().decode([Profile].self, from: data)
            DispatchQueue.main.async {
                completion(profile)
            }
        }.resume()
    }
}
