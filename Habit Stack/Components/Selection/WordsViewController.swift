import UIKit
import EasyPeasy

class WordsViewController: UIViewController {
    
    let tableView = UITableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        
        F.addWord(WordModel(word: "Manzana4", type: WordType.feminineNoun, translation: "Apple", examples: ["Me gusta los manzanas"], createdDate: Date()))
        F.addWord(WordModel(word: "Manzana5", type: WordType.masculineNoun, translation: "Apple", examples: ["Me gusta los manzanas"], createdDate: Date()))
        F.addWord(WordModel(word: "Manzana6", type: WordType.adjective, translation: "Apple", examples: ["Me gusta los manzanas"], createdDate: Date()))

        F.fetchWords { words in
            print(words)
            
        }
    }
}

extension WordsViewController {
    private func layout() {
        
    }
    
    func setup() {
        let emptyV = EmptyView()
        view.addSubview(emptyV)
        emptyV.easy.layout(Edges())
        
        navigationItem.title = "Word Stack"
        navigationItem.rightBarButtonItem = UIBarButtonItem(image: R.image.wsAdd()!, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addAction))
        navigationItem.rightBarButtonItem?.tintColor = .brandPink
//        navigationItem.rightBarButtonItem = UIBarButtonItem(image: R.image.wsAdd()!, style: UIBarButtonItem.Style.plain, target: self, action: #selector(addAction))
    }
}

extension WordsViewController {
    
    @objc func addAction() {
        
    }
    
}
