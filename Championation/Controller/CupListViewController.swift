import UIKit

class CupListViewController: UIViewController {
  var button: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    button.backgroundColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    button.isHidden = true
    return button
  }()
  
  private let matchesCollectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(LeagueCollectionViewCell.self, forCellWithReuseIdentifier: LeagueCollectionViewCell.id)
    collectionView.backgroundColor = .clear
    return collectionView
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    view.addSubview(button)
    
    matchesCollectionView.delegate = self
    matchesCollectionView.dataSource = self
    view.addSubview(matchesCollectionView)
    
    makeConstraints()
  }
  
  func makeConstraints() {
    NSLayoutConstraint.activate([
      button.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 2),
      button.leftAnchor.constraint(equalTo: view.leftAnchor),
      button.rightAnchor.constraint(equalTo: view.rightAnchor),
      
      matchesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
      matchesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
      matchesCollectionView.topAnchor.constraint(equalTo: button.bottomAnchor),
      matchesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
  }
    
}

extension CupListViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 25
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: LeagueCollectionViewCell.id, for: indexPath) as? LeagueCollectionViewCell
    else {
      fatalError("UnSupported")
    }
      cell.leagueCountry.image = UIImage(named: "\(indexPath.row)")
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 50)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }

}
