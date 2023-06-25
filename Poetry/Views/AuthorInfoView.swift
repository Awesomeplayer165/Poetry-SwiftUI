import SwiftUI

struct AuthorInfoView: View {
    public var author: String
    @State private var authorInfo: AuthorInfo?
    
    var body: some View {
        List {
            if let authorInfo = authorInfo {
                ForEach(authorInfo.poems, id: \.title) { poem in
                    NavigationLink(poem.title) {
                        PoemView(poem: poem)
                    }
                }
            }
        }
        .navigationTitle("Poems")
        .task {
            self.authorInfo = try! await PoetryAPI.shared.getPoems(from: author)
        }
    }
}
