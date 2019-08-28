import RxSwift
import RxCocoa

class WordsViewModel {
    var wordList = BehaviorRelay<[WordModel]>(value: [])
    var currentPage: UInt = 1
    
    func getData() {
        F.fetchWords(page: currentPage)  { [weak self] arr in
            self?.wordList.accept(arr)
        }
    }
    
    func getNextPage() {
        currentPage += 1
        getData()
    }
    
    init() {
        getData()
    }
}
