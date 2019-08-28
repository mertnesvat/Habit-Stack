import UIKit
import EasyPeasy
import RxSwift
import RxCocoa

class WordsViewController: UIViewController {
    
    let disposeBag = DisposeBag()
    
    let tableView = UITableView()
    let viewModel = WordsViewModel()
    let emptyV = EmptyView()
    var addButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupRx()
        layout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getData()
    }
}

extension WordsViewController {
    func setup() {
        
//        ModelWords().addMe()
        
        navigationItem.title = "Word Stack"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.fastForward, target: self, action: #selector(fastForwards))
//        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: UIBarButtonItem.SystemItem.bookmarks, target: self, action: #selector(downloadPage))
        navigationItem.rightBarButtonItem?.tintColor = .brandPink
        navigationItem.leftBarButtonItem?.tintColor = .brandPink

        view.addSubviews([tableView, addButton])
        tableView.register(WordCell.self, forCellReuseIdentifier: "WordCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65.0
        tableView.separatorStyle = .none
        
        addButton.setImage(R.image.addIcon()!, for: .normal)
        addButton.addTarget(self, action: #selector(addAction), for: .touchUpInside)
    }
    
    func setupRx() {
        viewModel.wordList.bind(to: self.tableView.rx.items(cellIdentifier: "WordCell", cellType: WordCell.self)) { (row, element, cell) in
            cell.setup(with: element)
            }.disposed(by: disposeBag)
        
        tableView.rx.prefetchRows.subscribe(onNext: { [weak self] idx in
            print(idx)
            let needsFetch = idx.contains { $0.row >= ((self?.viewModel.wordList.value.count ?? Int.max) - 1) }
            if needsFetch {
                self?.viewModel.getNextPage()
            }
        }).disposed(by: disposeBag)
        
        viewModel.wordList.subscribe(onNext: { [weak self] words in
            if words.isEmpty {
                self?.tableView.backgroundView = self?.emptyV
            } else {
                self?.tableView.backgroundView = nil
            }
        }).disposed(by: self.disposeBag)
    }
    
    private func layout() {
        tableView.easy.layout(Edges())
        addButton.easy.layout(Bottom(16), Right(16), Height(50), Width(50))
    }
}

extension WordsViewController {
    @objc func addAction() {
        self.navigationController?.present(AddHabitViewController(), animated: true, completion: nil)
    }
    
    @objc func fastForwards() {
        self.navigationController?.present(BrainOverloadViewController(), animated: true, completion: nil)
    }
    
    @objc func downloadPage() {
        
    }
}
