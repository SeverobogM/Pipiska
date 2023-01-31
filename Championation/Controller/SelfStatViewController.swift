import UIKit

class SelfStatViewController: UIViewController {
  private let selfStatCollectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(SelfStatCollectionViewCell.self, forCellWithReuseIdentifier: SelfStatCollectionViewCell.id)
    collectionView.register(SectionHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: SectionHeader.ReuseIdentifier)
    collectionView.backgroundColor = .clear
    return collectionView
  }()
  
  let backTopBar: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let firstBigLogo: UIImageView = {
    let image = UIImage(named: "BigClubLogo")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let firstName: UILabel = {
    let label = UILabel()
    label.text = "Team One"
    label.font = label.font.withSize(25)
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let secondBigLogo: UIImageView = {
    let image = UIImage(named: "BigClubLogo")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let secondName: UILabel = {
    let label = UILabel()
    label.text = "Team Two"
    label.font = label.font.withSize(25)
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Self Stat"
    view.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
    
    view.addSubview(backTopBar)
    //view.addSubview(firstBigLogo)
    //view.addSubview(firstName)
    
    selfStatCollectionView.delegate = self
    selfStatCollectionView.dataSource = self
    view.addSubview(selfStatCollectionView)
    
    //view.addSubview(secondBigLogo)
    //view.addSubview(secondName)
    
    makeConstraints()
  }

  private func makeConstraints() {
    NSLayoutConstraint.activate([
      backTopBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      backTopBar.leftAnchor.constraint(equalTo: view.leftAnchor),
      backTopBar.rightAnchor.constraint(equalTo: view.rightAnchor),
      backTopBar.topAnchor.constraint(equalTo: view.topAnchor),
      backTopBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      /*
      firstBigLogo.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      firstBigLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
      
      firstName.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      firstName.topAnchor.constraint(equalTo: firstBigLogo.bottomAnchor, constant: 5), */
      
      selfStatCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor),
      selfStatCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor),
      selfStatCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      selfStatCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
    ])

  }
  
}

extension SelfStatViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func numberOfSections(in collectionView: UICollectionView) -> Int {
    return 2
  }
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 3
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SelfStatCollectionViewCell.id, for: indexPath) as? SelfStatCollectionViewCell
    else {
      fatalError("UnSupported")
    }
    
    //cell.statsPositionName.text = statsArray[indexPath.row]
    
    cell.configure()
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
    return CGSize(width: view.frame.width, height: 150)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 90)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }
  
  func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {

      if let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "SectionHeader", for: indexPath) as? SectionHeader {
        return sectionHeader
      }
      return UICollectionReusableView()
  }

}
