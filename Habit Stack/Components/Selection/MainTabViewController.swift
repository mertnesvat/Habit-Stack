import UIKit

class MainTabViewController: UITabBarController {
    init() {
        super.init(nibName: nil, bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        (self.viewControllers?[0] as! HabitSelectionViewController).tabBarItem = UITabBarItem(title: R.string.key.habits(), image: R.image.habitsIcon()!, selectedImage: R.image.habitsIcon()!)
        (self.viewControllers?[1] as! AddHabitViewController).tabBarItem = UITabBarItem(title: "", image: R.image.addIcon()!, selectedImage: R.image.addIcon()!)
        (self.viewControllers?[2] as! TodayViewController).tabBarItem = UITabBarItem(title: R.string.key.today(), image: R.image.todayIcon()!, selectedImage: R.image.todayIcon()!)
        self.tabBar.tintColor = .brandOrange
    }
}
