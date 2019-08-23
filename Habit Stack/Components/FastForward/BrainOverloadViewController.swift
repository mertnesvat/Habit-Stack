import UIKit
import EasyPeasy
import LTMorphingLabel

class BrainOverloadViewController: UIViewController {
    let word = LTMorphingLabel()
    let translation = LTMorphingLabel()
    var wordList: [WordModel] = []
    var index = 0
    let close = UIButton()
    var timer: Timer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        layout()
        setupRx()
    }
}

extension BrainOverloadViewController {
    func setup() {
        let effect = LTMorphingEffect(rawValue: 3)

        word.textColor = .titleGray
        word.delegate = self
        word.font = .huge
        word.morphingEffect = effect!
        translation.textColor = .brandPink
        translation.delegate = self
        translation.morphingEffect = effect!
        translation.font = .heading1
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
        translation.easy.layout(Top(40).to(word, .bottom), CenterX())
        close.easy.layout(Top(40), Right(16), Width(40), Height(40))
    }
    
    func start() {
        timer = Timer.scheduledTimer(timeInterval: 2, target: self, selector: #selector(self.updateText), userInfo: nil, repeats: true)

    }
    
    @objc func closeExample() {
        self.timer?.invalidate()
        self.dismiss(animated: true, completion: nil)
    }
    
    @objc func updateText() {
        self.word.text = wordList[index].word
        self.translation.text = wordList[index].translation
        
        if index < wordList.count-1 {
            index += 1
        } else {
            closeExample()
        }
    }
}

extension BrainOverloadViewController: LTMorphingLabelDelegate {
    func morphingDidStart(_ label: LTMorphingLabel) {
        
    }
    
    func morphingDidComplete(_ label: LTMorphingLabel) {
        
    }
    
    func morphingOnProgress(_ label: LTMorphingLabel, progress: Float) {
        
    }
}
