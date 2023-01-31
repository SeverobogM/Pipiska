import UIKit

final class SelectedViewController: UIViewController {
    
    private var allGames: [SquashGame] = []
    private var league = SquashData(name: "Name", id: "614")
    
  var control: UISegmentedControl = {
    let segmentItems = ["Upcoming", "Past"]
    let control = UISegmentedControl(items: segmentItems)
    control.selectedSegmentTintColor = #colorLiteral(red: 0.9576455951, green: 0.8690345883, blue: 0.178919822, alpha: 1)
    control.backgroundColor = #colorLiteral(red: 0.5608567595, green: 0.4777524471, blue: 0.01233047713, alpha: 1)
    control.translatesAutoresizingMaskIntoConstraints = false
    control.selectedSegmentIndex = 0
    return control
  }()
  
  private let matchesCollectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(MatchCollectionViewCell.self, forCellWithReuseIdentifier: MatchCollectionViewCell.id)
    collectionView.backgroundColor = .clear
    return collectionView
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    
    view.addSubview(control)
    control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
    
    matchesCollectionView.delegate = self
    matchesCollectionView.dataSource = self
    view.addSubview(matchesCollectionView)
    
    makeConstraints()
  }
  
  @objc func segmentControl(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
      case 0:
        control.selectedSegmentIndex = 0
      matchesCollectionView.reloadData()
      case 1:
        control.selectedSegmentIndex = 1
      matchesCollectionView.reloadData()
      default:
        break
    }
  }
  
  func makeConstraints() {
    NSLayoutConstraint.activate([
      control.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -10),
      control.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10),
      control.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      
      matchesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
      matchesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
      matchesCollectionView.topAnchor.constraint(equalTo: control.bottomAnchor),
      matchesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
      ])
  }
  
}

extension SelectedViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return AppDelegate.shared.selectedCount
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchCollectionViewCell.id, for: indexPath) as? MatchCollectionViewCell
    else {
      fatalError("UnSupported")
    }
      cell.configure(match: allGames[indexPath.row], league: league)
      
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 120)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }

}
