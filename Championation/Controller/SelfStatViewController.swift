import UIKit

class SelfStatViewController: UIViewController {
  let backTopBar: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Self Stat"
    view.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
    
    view.addSubview(backTopBar)
    makeConstraints()
  }

  private func makeConstraints() {
    NSLayoutConstraint.activate([
      backTopBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      backTopBar.leftAnchor.constraint(equalTo: view.leftAnchor),
      backTopBar.rightAnchor.constraint(equalTo: view.rightAnchor),
      backTopBar.topAnchor.constraint(equalTo: view.topAnchor),
      backTopBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
    ])

  }
  
}
