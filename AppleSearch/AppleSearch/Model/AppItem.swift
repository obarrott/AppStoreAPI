//
//  AppItem.swift
//  AppleSearch
//
//  Created by Owen Barrott on 9/24/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

import Foundation

struct AppTopLevelObject: Decodable {
    let results: [AppItem]
}

struct AppItem: Decodable {
    let trackName: String
    let description: String
    let artworkUrl100: URL?
}
