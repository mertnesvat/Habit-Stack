import Foundation
import FirebaseDatabase
import CodableFirebase
import FirebaseAuth

class F {
    static let myWords: DatabaseReference! = Database.database().reference().child("\(String(Auth.auth().currentUser?.uid ?? "noPerson"))/words")
    
    static func setUser() {
        
    }
    
    static func fetchWords(page: UInt, callback: @escaping ([WordModel]) -> Void) {
        var item: UInt = page * 30
        myWords.queryLimited(toFirst: item).observeSingleEvent(of: .value) { (ss) in
            let seq = ss.children
            var words = [WordModel]()
            while let rest = seq.nextObject() as? DataSnapshot {
                do {
                    let element = try FirebaseDecoder().decode(WordModel.self, from: rest.value!)
                    words.append(element)
                } catch {
                    print(error)
                }
            }

            callback(words)
        }
        
    }
    
    static func addWord(_ word: WordModel) {
        let data = try! FirebaseEncoder().encode(word)
        myWords.childByAutoId().setValue(data)
    }
}
