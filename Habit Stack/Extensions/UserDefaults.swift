import Foundation
import SwiftyUserDefaults

extension DefaultsKeys {
    static let currentUser = DefaultsKey<Bool>("currentUser", defaultValue: false)
    static let firstTimeUser = DefaultsKey<Bool>("firstTimeUser", defaultValue: true)

}
