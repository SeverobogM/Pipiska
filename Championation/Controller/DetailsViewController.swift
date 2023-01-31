import UIKit

class DetailsViewController: UIViewController {
  let backTopBar: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  var button: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    button.isHidden = true
    return button
  }()
  
  private let detailsCollectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(DetailsCollectionViewCell.self, forCellWithReuseIdentifier: DetailsCollectionViewCell.id)
    collectionView.backgroundColor = .clear
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Details"
    view.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
    
    view.addSubview(backTopBar)
    view.addSubview(button)
    
    detailsCollectionView.delegate = self
    detailsCollectionView.dataSource = self
    view.addSubview(detailsCollectionView)
    
    makeConstraints()
  }
  
  private func makeConstraints() {
    NSLayoutConstraint.activate([
      backTopBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      backTopBar.leftAnchor.constraint(equalTo: view.leftAnchor),
      backTopBar.rightAnchor.constraint(equalTo: view.rightAnchor),
      backTopBar.topAnchor.constraint(equalTo: view.topAnchor),
      backTopBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      
      button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0.1),
      button.leftAnchor.constraint(equalTo: view.leftAnchor),
      button.rightAnchor.constraint(equalTo: view.rightAnchor),
      
      detailsCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
      detailsCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
      detailsCollectionView.topAnchor.constraint(equalTo: button.bottomAnchor),
      detailsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
    ])
  }
    
}

extension DetailsViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 5
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DetailsCollectionViewCell.id, for: indexPath) as? DetailsCollectionViewCell
    else {
      fatalError("UnSupported")
    }
    
    cell.configure()
    cell.backgroundColor = .white
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 40)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return -2
  }

}
