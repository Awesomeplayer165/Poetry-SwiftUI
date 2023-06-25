import SwiftUI

struct PoemView: View {
    public let poem: Poem
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                Text(poem.author)
                    .font(.title)
                    .padding(.leading, 13)
                
                ForEach(poem.lines, id: \.self) { line in
                    Text(line)
                }
                
                Text("\(poem.linecount) Lines")
            }
            .navigationTitle(poem.title)
        }
    }
}
