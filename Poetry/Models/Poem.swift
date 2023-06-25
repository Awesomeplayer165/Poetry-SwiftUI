import SwiftUI

struct Poem: Codable {
    public let title:  String
    public let author: String
    public let lines: [String]
    public let linecount: String
}

extension Poem: Identifiable {
    public typealias ID = String
    
    var id: String { title }
}
