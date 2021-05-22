//
//  SongsService.swift
//  Observable-Demo
//
//  Created by Ankit Jaiswal on 22/05/21.
//

import Foundation

class SongsService {
    func getAllSongs(singerName: String, completion: @escaping ([Song]?) -> ()) {
        guard let url = URL(string: "https://itunes.apple.com/search?term=\(singerName)") else {
            completion(nil)
            return
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }
            
            let songResponse = try? JSONDecoder().decode(SongResponse.self, from: data)
            
            if let songResponse = songResponse {
                let songs = songResponse.results
                completion(songs)
            }
        }.resume()
    }
}
