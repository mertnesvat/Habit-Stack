import UIKit
import EasyPeasy

class AddHabitViewController: UIViewController {
    let word = UITextField()
    let translation = UITextField()
    let example = UITextView()
    var type = [UIButton]()
    let submit = UIButton()
    let addNewWord = TitleLabel()
    
    let containerView = UIView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        setupRx()
        layout()
    }

}

extension AddHabitViewController {
    func setup() {
        containerView.addSubviews([word, translation, example, submit, addNewWord])
        
        for (i, btn) in [UIButton(), UIButton(), UIButton(), UIButton()].enumerated() {
            containerView.addSubview(btn)
            type.append(btn)
            switch i {
            case 0:
                btn.titleLabel?.text = "Verb"
            case 1:
                btn.titleLabel?.text = "Adjective"
            case 2:
                btn.titleLabel?.text = "Feminine Noun"
            case 3:
                btn.titleLabel?.text = "Masculine Noun"
            default:
                break
            }
        }
        
        view.addSubview(containerView)
        view.backgroundColor = .clear
        containerView.backgroundColor = .brandPink
        containerView.layer.cornerRadius = 16
        containerView.layer.masksToBounds = true
        
        word.backgroundColor = .white
        word.layer.cornerRadius = 8
        word.leftViewMode = .always
        word.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        word.layer.masksToBounds = true
        
        translation.backgroundColor = .white
        translation.leftView = UIView.init(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        translation.layer.cornerRadius = 8
        translation.layer.masksToBounds = true
        
        submit.setBackgroundImage(R.image.wsAdd()!, for: .normal)
        submit.backgroundColor = .white
        submit.layer.cornerRadius = 30
        submit.layer.masksToBounds = true
        
    }
    
    func setupRx() {
        
    }
    
    func layout() {
        addNewWord.easy.layout(Top(30), Left(20), Height(30))
        submit.easy.layout(Top(12), Right(12), Height(60), Width(60))
        word.easy.layout(Left(20), Right(20), Top(10).to(submit, .bottom), Height(60))
        translation.easy.layout(Left(20), Right(20), Top(10).to(word, .bottom), Height(40))
        
        type[0].easy.layout(Left(20), Top(10).to(translation, .bottom), Height(36), Right(8).to(type[1], .left), Width(*1).like(type[1]))
        type[1].easy.layout(Right(20), Top(10).to(translation, .bottom), Height(36), Left(8).to(type[0], .right))
        
        type[2].easy.layout(Left(20), Top(10).to(type[0], .bottom), Height(36), Right(8).to(type[3], .left))
        type[3].easy.layout(Right(20), Top(10).to(type[0], .bottom), Height(36), Left(8).to(type[2], .right), Width(*1).like(type[2]))
        
        example.easy.layout(Height(80), Top(10).to(type[3], .bottom), Left(20), Right(20), Bottom(20))
        
        containerView.easy.layout(Top(74), Left(8), Right(8))
    }
}
