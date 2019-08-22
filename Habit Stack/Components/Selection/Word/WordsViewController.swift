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
}

extension WordsViewController {
    func setup() {
        navigationItem.title = "Word Stack"
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: R.image.wsAdd()!, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addAction))
//        navigationItem.rightBarButtonItem?.tintColor = .brandPink
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
}
