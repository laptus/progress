import SwiftyJSON

struct MusicInfo: Codable {
    let song: String
    let artist: String
    let album: String
    
    init(json: JSON){
        artist = json["artistName"].stringValue
        album = json["collectionName"].stringValue
        song = json["trackName"].stringValue
    }
}
