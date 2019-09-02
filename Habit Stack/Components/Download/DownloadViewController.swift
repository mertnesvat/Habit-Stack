import Foundation
import UIKit
import EasyPeasy
import RxSwift
import RxCocoa

class DownloadViewController: UIViewController {

    let tableView = UITableView()
    let viewModel: DownloadViewModel = DownloadViewModel()
    let disposeBag = DisposeBag()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        setupRx()
        setupLayout()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        viewModel.getData()
    }
}

extension DownloadViewController {
    func setupUI() {
        view.addSubview(tableView)
        tableView.register(WordCell.self, forCellReuseIdentifier: "DownloadCell")
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 65.0
        tableView.separatorStyle = .none
        
        navigationItem.title = "Install Words"
        navigationItem.rightBarButtonItem = UIBarButtonItem.init(barButtonSystemItem: UIBarButtonItem.SystemItem.done, target: self, action: #selector(doneButtonClicked))
    }
    
    func setupLayout() {
        tableView.easy.layout(Edges())
    }
    
    func setupRx() {
        viewModel.downloadable.bind(to: self.tableView.rx.items(cellIdentifier: "DownloadCell", cellType: WordCell.self)) { (row, element, cell) in
            cell.setup(with: element)
        }.disposed(by: disposeBag)
        
        tableView.rx.prefetchRows.subscribe(onNext: { [weak self] idx in
            print(idx)
            let needsFetch = idx.contains { $0.row >= ((self?.viewModel.downloadable.value.count ?? Int.max) - 1) }
            if needsFetch {
                self?.viewModel.getNextPage()
            }
        }).disposed(by: disposeBag)
        
        tableView.rx.itemSelected.subscribe(onNext: { [weak self] (idx) in
            guard let self = self else { return }
            var fill = self.viewModel.downloadable.value[idx.row].prettyWords.count
            self.viewModel.downloadable.value[idx.row].prettyWords.forEach({ (dic) in
                print(fill)
                F.add(WordModel(word: dic.key, type: .unknown, translation: dic.value, createdDate: Date()))
                fill -= 1
                if fill == 0 {
                    (self.tableView.cellForRow(at: idx) as? WordCell)?.install?.setTitle("Installed", for: .normal)
                }
            })
        }).disposed(by: disposeBag)

    }
    
    @objc func doneButtonClicked() {
        self.dismiss(animated: true, completion: nil)
    }
}
