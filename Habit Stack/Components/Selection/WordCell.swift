import UIKit
import EasyPeasy

class WordCell: UITableViewCell {
    
    let word = TitleLabel()
    let translation = UILabel()
    let example = DescriptionLabel()
    let type = WordTypeView(frame: .zero)
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews([word, translation, example, type])
        layout()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        addSubviews([word, translation, example, type])
        layout()
    }
    
    func setup(with data: WordModel) {
        word.text = data.word
        translation.text = data.translation
        example.text = data.examples?.first
        
        if let ty = data.type {
            type.setup(with: ty)
        }
    }
    
    func layout() {
        word.easy.layout(Left(8), Top())
        translation.easy.layout(Left(8), Top(8).to(word, .bottom))
        example.easy.layout(Bottom(), Right(8), Left(8), Top(20).to(translation, .bottom))
        type.easy.layout(Right(8), Top())
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
