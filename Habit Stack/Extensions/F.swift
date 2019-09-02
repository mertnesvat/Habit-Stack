import Foundation
import FirebaseDatabase
import CodableFirebase
import FirebaseAuth

class F {
    static let myWords: DatabaseReference! = Database.database().reference().child("\(String(Auth.auth().currentUser?.uid ?? "noPerson"))/words")
    static let downloadable: DatabaseReference! = Database.database().reference().child("downloadable/")

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
    
    static func fetchDownloadable(page: UInt, callback: @escaping ([DownloadModel]) -> Void) {
        var item: UInt = page * 30
        downloadable.queryLimited(toFirst: item).observeSingleEvent(of: .value) { (ss) in
            let seq = ss.children
            var words = [DownloadModel]()
            while let rest = seq.nextObject() as? DataSnapshot {
                do {
                    let element = try FirebaseDecoder().decode(DownloadModel.self, from: rest.value!)
                    words.append(element)
                } catch {
                    print(error)
                }
            }
            
            callback(words)
        }
    }
    
    static func add<T: Codable>(_ model: T) {
        let data = try! FirebaseEncoder().encode(model)
        
        if T.self is DownloadModel.Type {
            downloadable.childByAutoId().setValue(data)
        } else if T.self is WordModel.Type {
            myWords.childByAutoId().setValue(data)
        }
    }
}
