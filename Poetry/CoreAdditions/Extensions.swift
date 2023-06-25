import SwiftUI

extension String {
    public func asURL() -> URL {
        URL(string: self)!
    }
}
