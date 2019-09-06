import UIKit
import EasyPeasy

class EmptyView: UIView {
    var image = UIImageView()
    var title = TitleLabel()
    var desc = DescriptionLabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupNoWords()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupNoWords()
    }
    
    private func setupNoWords() {
        image.image = R.image.noWords()!
        title.text = "Yayy!"
        title.textColor = .titleGray
        
        desc.text = "Fill your stack \n with rarefied words!"
        desc.textColor = .brandPink
        desc.textAlignment = .center
        desc.numberOfLines = 2
        addSubviews([image, title, desc])
        layout()
    }
    
    private func layout() {
        title.easy.layout(CenterY(), CenterX())
        image.easy.layout(Bottom(5).to(title, .top), Height(78), Width(82), CenterX())
        desc.easy.layout(Top(5).to(title, .bottom), CenterX(), Left(30), Right(30))
    }
}

