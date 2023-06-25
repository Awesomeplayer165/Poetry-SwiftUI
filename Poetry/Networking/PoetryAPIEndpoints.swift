import SwiftUI

class PoetryAPIEndpoints {
    static private let host = "https://poetrydb.org"
    static public let authors = "\(host)/author" 
    
    static public func author(_ author: String) -> String { "\(authors)/\(author.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed)!)" }
}
