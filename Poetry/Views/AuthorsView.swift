import SwiftUI
import UIKit

struct AuthorsView: View {
    @State private var authors: [String] = []
    
    var body: some View {
        NavigationView {
            List {
                ForEach(authors, id: \.self) { author in
                    NavigationLink(author) {
                        AuthorInfoView(author: author)
                    }
                }
            }
            .navigationTitle("Authors")
        }
        .task {
            self.authors = try! await PoetryAPI.shared.getAuthors()
        }
    }
}
