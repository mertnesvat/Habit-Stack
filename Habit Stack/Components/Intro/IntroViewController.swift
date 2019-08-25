import Foundation
import UIKit
import RxSwift
import RxCocoa
import EasyPeasy

class IntroViewController: UIViewController {
    let viewModel = IntroViewModel()
    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var nextButton: MainButton!
    @IBOutlet weak var pageControl: UIPageControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
        
    }
    
    @IBAction func nextButtonClicked(_ sender: Any) {
        AppDelegate.shared.window?.rootViewController = R.storyboard.main.storyTab()!
        AppDelegate.shared.window?.makeKeyAndVisible()
    }
}

extension IntroViewController {
    func setup() {
        scrollView.isPagingEnabled = true
        pageControl.numberOfPages = viewModel.texts.count
        scrollView.contentSize = CGSize(width: UIScreen.main.bounds.width * CGFloat(viewModel.texts.count), height: 0)
        scrollView.contentOffset = CGPoint(x: 0, y: 0)
        scrollView.zoomScale = 1.0
        
        for (i, text) in viewModel.texts.enumerated() {
            let w = UIScreen.main.bounds.width * CGFloat(i) + 20.0
            let rect = CGRect(x: w, y: 40.0, width: UIScreen.main.bounds.width - 40.0, height: UIScreen.main.bounds.height/2)
            let textView = UITextView(frame: rect)
            textView.isUserInteractionEnabled = false
            textView.text = text
            textView.textColor = .mainTextColor
            textView.font = UIFont.heading1

            scrollView.addSubview(textView)
        }
        
        nextButton.isEnabled = false
    }
}

extension IntroViewController: UIScrollViewDelegate {
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        pageControl.currentPage = Int(scrollView.contentOffset.x / scrollView.frame.width)
        print(pageControl.currentPage)
        if pageControl.currentPage == viewModel.texts.count-1 {
            nextButton.isEnabled = true
        } else {
            nextButton.isEnabled = false
        }
    }
    
    func scrollViewDidZoom(_ scrollView: UIScrollView) {
        print(scrollView)
    }
}
