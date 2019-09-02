import RxSwift
import RxCocoa

class DownloadViewModel {
    var downloadable = BehaviorRelay<[DownloadModel]>(value: [])
    var currentPage: UInt = 1
    
    func getData() {
        F.fetchDownloadable(page: currentPage) { [weak self] models in
            self?.downloadable.accept(models)
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
