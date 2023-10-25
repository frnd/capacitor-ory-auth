import Foundation

@objc public class OryAuth: NSObject {
    @objc public func echo(_ value: String) -> String {
        print(value)
        return value
    }
}
