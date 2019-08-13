import UIKit
import EasyPeasy

class HabitSelectionViewController: UIViewController {
    
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

extension HabitSelectionViewController {
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

extension HabitSelectionViewController {
    
    @objc func addAction() {
        
    }
    
}
