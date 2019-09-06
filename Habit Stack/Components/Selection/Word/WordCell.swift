import UIKit
import EasyPeasy

class WordCell: UITableViewCell {
    
    let word = TitleLabel()
    let translation = UILabel()
    let type = WordTypeView(frame: .zero)
    var install: UIButton?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.addSubviews([word, translation, type])
        translation.font = UIFont.heading3
        contentView.backgroundColor = .white
        backgroundColor = .clear
        contentView.layer.shadowColor = UIColor.black.cgColor
        contentView.layer.shadowOffset = CGSize(width: 0, height: 6)
        contentView.layer.shadowRadius = 18
        contentView.layer.shadowOpacity = 0.2
        contentView.layer.cornerRadius = 8
        contentView.layer.masksToBounds = true
        
        if reuseIdentifier == "DownloadCell" {
            
            install = UIButton.init(type: .roundedRect)
            install?.tintColor = .brandPink
            install?.layer.borderWidth = 2
            install?.layer.borderColor = UIColor.brandPink.cgColor
            install?.setTitle("Install", for: .normal)
            install?.isUserInteractionEnabled = false
            contentView.addSubview(install!)
        }
        
        
        selectionStyle = .none
        
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        contentView.addSubviews([word, translation, type])
        layout()
    }
    
    func setup(with download: DownloadModel) {
        word.text = download.title
        translation.text = download.description
        
        type.isHidden = true
    }
    
    func setup(with data: WordModel) {
        word.text = data.word
        translation.text = data.translation
        translation.numberOfLines = 0
        
        if let ty = data.type {
            type.setup(with: ty)
        }
    }
    
    func layout() {
        contentView.easy.layout(Edges(8))
        word.easy.layout(Left(8), Top(5), Height(34))
        translation.easy.layout(Left(8), Right(8), Top(8).to(word, .bottom), Bottom(), Height(80))
        type.easy.layout(Right(8), Top(5))
        
        if let b = install {
            b.easy.layout(Right(20), Width(70), Height(20), Bottom(20))
        }
    }
}

class WordTypeView: UIView {
    func setup(with type: WordType) {
        switch type {
        case .feminineNoun:
            let feminine = UILabel()
            feminine.text = "Feminine"
            feminine.font = UIFont.typeTagSmallText
            feminine.textColor = .brandPink
            feminine.textAlignment = .right
            let noun = UILabel()
            noun.text = "Noun"
            noun.font = .desc
            noun.textColor = .brandPink
            noun.textAlignment = .right

            self.addSubviews([feminine, noun])

            feminine.easy.layout(Top(), Right(8))
            noun.easy.layout(Top().to(feminine, .bottom), Right(8))
            
        case .masculineNoun:
            let feminine = UILabel()
            feminine.text = "Masculine"
            feminine.font = UIFont.typeTagSmallText
            feminine.textColor = .brandPink
            feminine.textAlignment = .right
            let noun = UILabel()
            noun.text = "Noun"
            noun.font = .desc
            noun.textColor = .brandPink
            noun.textAlignment = .right
            
            self.addSubviews([feminine, noun])
            
            feminine.easy.layout(Top(), Right(8))
            noun.easy.layout(Top().to(feminine, .bottom), Right(8))

            
        case .adjective:
            let adj = UILabel()
            adj.text = "Adjective"
            adj.font = .desc
            adj.textColor = .brandPink
            adj.textAlignment = .right

            addSubview(adj)
            adj.easy.layout(Top(), Right(8))

        case .verb:
            let verb = UILabel()
            verb.text = "Verb"
            verb.font = .desc
            verb.textColor = .brandPink
            verb.textAlignment = .right
            
            addSubview(verb)
            verb.easy.layout(Top(), Right(8))
        default:
            break
        }
    }
}
