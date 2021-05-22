//
//  ContentView.swift
//  Observable-Demo
//
//  Created by Ankit Jaiswal on 22/05/21.
//

import SwiftUI

struct ContentView: View {
            
    #if DEBUG
    let songVM: SongViewModel

    init(){
       self.songVM = SongViewModel()
       songVM.songs = songVM.getMockData()
    }
    #else
    @ObservedObject var songVM = SongViewModel()
    
    init() {
        songVM.fetchAllSongs()
    }
    #endif
    
    var body: some View {
        Group {
            List(songVM.songs, id: \.artistId) { song in
                Text(song.artistName ?? "")
            }
            Button("Load Again") {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
