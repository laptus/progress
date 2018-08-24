import Alamofire
import Foundation
import SwiftyJSON

class ItunesService {
    
    static let path = "https://itunes.apple.com/search?term="
    static let queue = DispatchQueue(label: "News",
                                     qos: .background,
                                     attributes:  DispatchQueue.Attributes.concurrent,
                                     autoreleaseFrequency: DispatchQueue . AutoreleaseFrequency .inherit,
                                     target: DispatchQueue .global(qos: DispatchQoS.QoSClass.background))
    
    static func getMusic(searchText: [String], completion: @escaping([MusicInfo]) -> Void) {
        let fullPath = path + searchText.joined(separator: "+")
        Alamofire.request(fullPath).responseData(queue: DispatchQueue.global()){response in
            guard let data = response.value else { return }
            let json = try! JSON(data:data)
            let songs: [MusicInfo] = json["results"].array?.flatMap {json in
                if json["kind"].exists() && json["kind"].stringValue == "song" {
                    return MusicInfo(json: json)
                }
                return nil} ?? []
            DispatchQueue.main.async{
                completion(songs)
            }
        }
    }
}

