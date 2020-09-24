//
//  MusicItem.swift
//  AppleSearch
//
//  Created by Owen Barrott on 9/24/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

import Foundation

struct MusicTopLevelObject: Decodable {
    let results: [MusicTrack]
}

struct MusicTrack: Decodable {
    let artistName: String
    let trackName: String
    let artworkUrl100: URL?
}
