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
        layout()
    }
}

extension WordsViewController {
    private func layout() {
        
    }
    
    func setup() {
        navigationItem.title = "Word Stack"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: R.image.wsAdd()!, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem?.tintColor = .brandPink
        view.addSubview(tableView)
        tableView.register(WordCell.self, forCellReuseIdentifier: "WordCell")
        tableView.easy.layout(Edges())
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65.0

//        viewModel.wordList.subscribe(onNext: { [weak self] models in
//            self?.tableView.reloadData()
//        }).disposed(by: disposeBag)
        
        viewModel.wordList.bind(to: self.tableView.rx.items(cellIdentifier: "WordCell", cellType: WordCell.self)) { (row, element, cell) in
            cell.setup(with: element)
        }.disposed(by: disposeBag)
    }
}

extension WordsViewController {
    
    @objc func addAction() {
        
    }
    
}

//extension WordsViewController: UITableViewDataSource {
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return viewModel.wordList.value.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        guard let cell = tableView.dequeueReusableCell(withIdentifier: "WordCell", for: indexPath) as? WordCell else {
//            return UITableViewCell()
//        }
//
//        cell.setup(with: viewModel.wordList.value[indexPath.row])
//
//        return cell
//    }
//    
//    
//}
//
//extension WordsViewController: UITableViewDelegate {
//    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
//        return UITableView.automaticDimension
//    }
//}
