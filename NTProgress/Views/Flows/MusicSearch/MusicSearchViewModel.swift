import Foundation
import UIKit

class MusicSearchViewModel: NSObject{
    var searchResult: [MusicInfo]
    var searchText: String
    
    override init() {
        searchResult = []
        searchText = ""
    }
    
    func runSearch(searchText: [String], tableView: UITableView){
        search(searchText: searchText, tableView: tableView)
    }
    
    func search(searchText: [String], tableView: UITableView) {
        ItunesService.getMusic(searchText: searchText) { [weak self] result in
            self?.searchResult = result
            tableView.reloadData()
        }
    }
}

extension MusicSearchViewModel: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return searchResult.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "MusicInfoCell", for: indexPath) as! MusicInfoCell
        let info = searchResult[indexPath.row]
        cell.id.text = indexPath.row.description
        cell.song.text = info.song //+ "\n"+info.artist + " - " + info.album
        cell.artist.text = info.artist + " - " + info.album
        return cell
    }
}
