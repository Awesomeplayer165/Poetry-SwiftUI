import SwiftUI

class PoetryAPI {
    static public let shared = PoetryAPI()
    
    public func getAuthors() async throws -> [String] {
        let (data, response) = try await URLSession.shared.data(from: PoetryAPIEndpoints.authors.asURL())
        
        struct Authors: Codable {
            public let authors: [String]
        }
        
        return try JSONDecoder().decode(Authors.self, from: data).authors
    }
    
    public func getPoems(from author: String) async throws -> AuthorInfo {
        let (data, response) = try await URLSession.shared.data(from: PoetryAPIEndpoints.author(author).asURL())
        return try AuthorInfo(poems: try! JSONDecoder().decode([Poem].self, from: data))
    }
}
