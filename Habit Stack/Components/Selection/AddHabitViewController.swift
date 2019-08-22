import UIKit
import EasyPeasy

class AddHabitViewController: UIViewController {
    let word = InsetTextField()
    let translation = InsetTextField()
    let example = UITextView()
    let exampleLabel = UILabel()
    var type = [UIButton]()
    let submit = UIButton()
    let addNewWord = TitleLabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupRx()
        layout()
    }
}

extension AddHabitViewController {
    func setup() {
        view.addSubviews([word, translation, example, submit, exampleLabel, addNewWord])
        for (i, btn) in [UIButton(), UIButton(), UIButton(), UIButton()].enumerated() {
            switch i {
            case 0:
                btn.setTitle("Verb", for: .normal)
            case 1:
                btn.setTitle("Adjective", for: .normal)
            case 2:
                btn.setTitle("Feminine Noun", for: .normal)
            case 3:
                btn.setTitle("Masculine Noun", for: .normal)
            default:
                break
            }
            
            btn.backgroundColor = .white
            btn.layer.cornerRadius = 8
            btn.layer.masksToBounds = true
            btn.setTitleColor(.brandPink, for: .selected)
            btn.setTitleColor(UIColor.brandPink.withAlphaComponent(0.3), for: .normal)
            btn.setTitleColor(UIColor.brandPink.withAlphaComponent(0.7), for: .highlighted)

            btn.titleLabel?.font = .heading2
            btn.addTarget(self, action: #selector(typeSelect(btn:)), for: .touchUpInside)

            view.addSubview(btn)
            type.append(btn)

        }
        
        view.backgroundColor = .brandPink
        word.backgroundColor = .white
        word.layer.cornerRadius = 8
//        word.leftViewMode = .always
//        word.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        word.layer.masksToBounds = true
        word.attributedPlaceholder = NSAttributedString(string: "Word", attributes: [NSAttributedString.Key.foregroundColor : UIColor.brandPink.withAlphaComponent(0.7)])
        word.textColor = .titleGray
        addNewWord.text = "Add New Word!"
        
        translation.backgroundColor = .white
        translation.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        translation.layer.cornerRadius = 8
        translation.layer.masksToBounds = true
        translation.attributedPlaceholder = NSAttributedString(string: "Translation", attributes: [NSAttributedString.Key.foregroundColor : UIColor.brandPink.withAlphaComponent(0.7)])
        translation.textColor = .titleGray
        
        exampleLabel.textColor = .white
        exampleLabel.font = .desc
        exampleLabel.text = "Example"
        
        submit.setBackgroundImage(R.image.addIcon()!, for: .normal)
        submit.backgroundColor = .white
        submit.layer.cornerRadius = 30
        submit.layer.masksToBounds = true
        
        example.layer.cornerRadius = 8
        example.layer.masksToBounds = true
        example.textColor = .titleGray
        
    }
    
    @objc func typeSelect(btn: UIButton) {
        type.forEach {
            $0.isSelected = false
        }
        
        btn.isSelected = true
    }
    
    func setupRx() {
        
    }
    
    func layout() {
        addNewWord.easy.layout(Top(60), Left(20), Height(30))
        submit.easy.layout(Bottom(16), Right(16), Height(50), Width(50))
        word.easy.layout(Left(20), Right(20), Top(10).to(addNewWord, .bottom), Height(60))
        translation.easy.layout(Left(20), Right(20), Top(10).to(word, .bottom), Height(40))
        
        type[0].easy.layout(Left(20), Top(10).to(translation, .bottom), Height(36), Right(8).to(type[1], .left), Width(*1).like(type[1]))
        type[1].easy.layout(Right(20), Top(10).to(translation, .bottom), Height(36), Left(8).to(type[0], .right))
        
        type[2].easy.layout(Left(20), Top(10).to(type[0], .bottom), Height(36), Right(8).to(type[3], .left))
        type[3].easy.layout(Right(20), Top(10).to(type[0], .bottom), Height(36), Left(8).to(type[2], .right), Width(*1).like(type[2]))
        
        exampleLabel.easy.layout(Top(10).to(type[3], .bottom), Left().to(example, .left))
        example.easy.layout(Height(80), Top(10).to(exampleLabel, .bottom), Left(20), Right(20))
    }
}
