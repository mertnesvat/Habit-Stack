import Foundation
import FirebaseDatabase
import CodableFirebase
import FirebaseAuth

class F {
    static let myWords: DatabaseReference! = Database.database().reference().child("\(String(Auth.auth().currentUser?.uid ?? "noPerson"))/words")
    
    static func setUser() {
        
    }
    
    static func fetchWords(callback: @escaping ([WordModel]) -> Void) {
        
        myWords.queryLimited(toLast: 30).observeSingleEvent(of: .value) { (ss) in
            let seq = ss.children
            var words = [WordModel]()
            while let rest = seq.nextObject() as? DataSnapshot {
                let element = try! FirebaseDecoder().decode(WordModel.self, from: rest.value!)
                words.append(element)
            }
            
            callback(words)
        }
    }
    
    static func addWord(_ word: WordModel) {
        let data = try! FirebaseEncoder().encode(word)
        myWords.childByAutoId().setValue(data)
    }
}
