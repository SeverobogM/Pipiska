import UIKit

class TabBarController: UITabBarController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    setupTabBar()
    
    tabBar.backgroundColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    tabBar.tintColor = .white
  }
  
  func setupTabBar() {
    let scheduleViewController = createNavigationController(viewController: ScheduleViewController(), itemName: "Schedule", itemImage: "Schedule", boolLarge: true)
    let selectedViewController = createNavigationController(viewController: SelectedViewController(), itemName: "Selected", itemImage: "Selected", boolLarge: true)
    let cupListViewController = createNavigationController(viewController: CupListViewController(), itemName: "CupList", itemImage: "CupList", boolLarge: true)
    let optionViewController = createNavigationController(viewController: OptionViewController(), itemName: "Option", itemImage: "Option", boolLarge: true)
    
    viewControllers = [scheduleViewController, selectedViewController, cupListViewController, optionViewController]
  }
  
  func createNavigationController(viewController: UIViewController, itemName: String, itemImage: String, boolLarge: Bool) -> UINavigationController {
    let item = UITabBarItem(title: itemName, image: UIImage(named: "\(itemImage)"), tag: 0)
    item.titlePositionAdjustment = .init(horizontal: 0, vertical: -12)
    
    let navigationController = UINavigationController(rootViewController: viewController)
    navigationController.tabBarItem = item
    navigationController.navigationBar.prefersLargeTitles = boolLarge
    navigationController.navigationBar.tintColor = .white
    navigationController.navigationBar.barTintColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    
    return navigationController
  }
  
  override func viewDidLayoutSubviews() {
    UIApplication.shared.statusBarFrame.height
    let statusBarHeight = view.window?.windowScene?.statusBarManager?.statusBarFrame.height ?? 0

    tabBar.frame = CGRect(x: 0, y: statusBarHeight, width: tabBar.frame.size.width, height: tabBar.frame.size.height + 45)
    super.viewDidLayoutSubviews()
  }
}
