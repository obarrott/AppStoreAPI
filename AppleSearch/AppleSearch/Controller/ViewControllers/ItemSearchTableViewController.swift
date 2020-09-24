//
//  ItemSearchTableViewController.swift
//  AppleSearch
//
//  Created by Owen Barrott on 9/24/20.
//  Copyright © 2020 Owen Barrott. All rights reserved.
//

import UIKit

class ItemSearchTableViewController: UITableViewController {

    // MARK: - Outlets
    @IBOutlet weak var entitySegmentedControl: UISegmentedControl!
    @IBOutlet weak var itunesSearchBar: UISearchBar!
    
    // MARK: - Properties
    var musicItems: [MusicTrack] = []
    var appItems: [AppItem] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        itunesSearchBar.delegate = self

    }
    
   
    
    
    // MARK: - Actions
    @IBAction func segmentedControlValueChanged(_ sender: Any) {
        search()
    }
    
    // MARK: - Helper Methods
    func search() {
        guard let searchTerm = itunesSearchBar.text, !searchTerm.isEmpty else { return }
        
        if entitySegmentedControl.selectedSegmentIndex == 0 {
            AppleStoreItmeController.fetchMusicItems(searchTerm: searchTerm) { (result) in
                DispatchQueue.main.async {
                    switch result {
                    case .success(let musicTracks):
                        self.musicItems = musicTracks
                        self.tableView.reloadData()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        } else {
            AppleStoreItmeController.fetchAppItems(searchTerm: searchTerm) { (result) in
                DispatchQueue.main.async {
                    switch result{
                    case .success(let apps):
                        self.appItems = apps
                        self.tableView.reloadData()
                    case .failure(let error):
                        print(error.localizedDescription)
                    }
                }
            }
        }
    }
    
    // MARK: - Table view data source

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {

        switch entitySegmentedControl.selectedSegmentIndex {
        case 0:
            return self.musicItems.count
        case 1:
            return self.appItems.count
        default:
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "entityCell", for: indexPath) as? EntityTableViewCell else { return UITableViewCell() }
        
        switch entitySegmentedControl.selectedSegmentIndex {
        case 0:
            let track = musicItems[indexPath.row]
            cell.musicTrack = track
            cell.appItem = nil
        case 1:
            let app = appItems[indexPath.row]
            cell.appItem = app
            cell.musicTrack = nil
        default:
            break
        }
        
        cell.updateViews()
        return cell
    }
}

extension ItemSearchTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        search()
    }
}
