//
//  Game.swift
//  Observable-Demo
//
//  Created by Ankit Jaiswal on 22/05/21.
//

import Foundation

struct SongResponse: Decodable {
    var resultCount: Int
    var results: [Song]
}

struct Song: Decodable {
    var artistName: String?
    var artistId: Int?
    var artworkUrl60: String?
    var collectionName: String?
}
