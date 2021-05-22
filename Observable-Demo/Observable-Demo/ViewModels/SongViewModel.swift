//
//  SongViewModel.swift
//  Observable-Demo
//
//  Created by Ankit Jaiswal on 22/05/21.
//

import Foundation
import Combine

class SongViewModel: ObservableObject {
    private var songService: SongsService!
    var singerName: String = "Michael+jackson"
    @Published var songs = [Song]()
    
    init() {
        self.songService = SongsService()
    }
    
    func fetchAllSongs() {
        songService.getAllSongs(singerName: singerName) { songs in
            if let songs = songs {
                DispatchQueue.main.async {
                    self.songs = songs
                }
            }
        }
    }
    
    func getMockData() -> [Song] {
        return [Song(artistName: "James211", artistId: 328254910, artworkUrl60: "", collectionName: "")]
    }
}
