import RxSwift
import RxCocoa

class WordsViewModel {
    var wordList = BehaviorRelay<[WordModel]>(value: [])
    
    func getData() {
        F.fetchWords { [weak self] arr in
            self?.wordList.accept(arr)
        }
    }
    
    init() {
        getData()
    }
}
