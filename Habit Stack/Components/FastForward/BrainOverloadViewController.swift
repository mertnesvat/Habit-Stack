import UIKit
import EasyPeasy

class BrainOverloadViewController: UIViewController {
    let word = TitleLabel()
    let translation = DescriptionLabel()
    var wordList: [WordModel] = []
    let close = UIButton()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        setupRx()
    }
}

extension BrainOverloadViewController {
    func setup() {
        word.textColor = .titleGray
        translation.textColor = .brandPink
        close.setImage(R.image.addIcon()!, for: .normal)
        close.addTarget(self, action: #selector(closeExample), for: .touchUpInside)
        view.addSubviews([word, translation, close])
    }
    
    func setupRx () {
        F.fetchWords { [weak self] list in
            self?.wordList = list
            self?.start()
        }

    }
    
    func layout() {
        word.easy.layout(CenterX(), CenterY())
        translation.easy.layout(Top(40).to(word, .bottom))
        close.easy.layout(Top(40), Right(16), Width(40), Height(40))
    }
    
    func start() {
        wordList.forEach { word in
            UIView.animate(withDuration: 1.0, animations: {
                self.word.text = word.word
                self.translation.text = word.translation
            })
        }
    }
    
    @objc func closeExample() {
        self.dismiss(animated: true, completion: nil)
    }
}
