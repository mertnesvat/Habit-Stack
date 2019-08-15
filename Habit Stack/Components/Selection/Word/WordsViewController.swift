import UIKit
import EasyPeasy
import RxSwift
import RxCocoa

class WordsViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let tableView = UITableView()
    let viewModel = WordsViewModel()
    let emptyV = EmptyView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupRx()
        layout()
    }
}

extension WordsViewController {
    func setup() {
        navigationItem.title = "Word Stack"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: R.image.wsAdd()!, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem?.tintColor = .brandPink
        view.addSubview(tableView)
        tableView.register(WordCell.self, forCellReuseIdentifier: "WordCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65.0
        tableView.separatorStyle = .none
    }
    
    func setupRx() {
        viewModel.wordList.bind(to: self.tableView.rx.items(cellIdentifier: "WordCell", cellType: WordCell.self)) { (row, element, cell) in
            cell.setup(with: element)
            }.disposed(by: disposeBag)
    }
    
    private func layout() {
        tableView.easy.layout(Edges())
    }
}

extension WordsViewController {
    @objc func addAction() {
        
    }
}
