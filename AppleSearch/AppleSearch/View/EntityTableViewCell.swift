//
//  EntityTableViewCell.swift
//  AppleSearch
//
//  Created by Owen Barrott on 9/24/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

import UIKit

class EntityTableViewCell: UITableViewCell {

    // MARK: - Outlets
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var entityImageView: UIImageView!
    
    // MARK: - Properties
    var musicTrack: MusicTrack?
    var appItem: AppItem?
    
    
    // MARK: - Helpers
    func updateViews() {
        var url: URL?
        
        if let musicTrack = musicTrack {
            titleLabel.text = musicTrack.trackName
            subtitleLabel.text = musicTrack.artistName
            url = musicTrack.artworkUrl100
        } else if let appItem = appItem {
            titleLabel.text = appItem.trackName
            subtitleLabel.text = appItem.description
            url = appItem.artworkUrl100
        }
        
        self.entityImageView.image = nil
        if let url = url {
            AppleStoreItmeController.fetchImageFrom(url: url) { (result) in
                switch result {
                case .success(let image):
                    DispatchQueue.main.async {
                        self.entityImageView.image = image
                    }
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
        }
    }
}
