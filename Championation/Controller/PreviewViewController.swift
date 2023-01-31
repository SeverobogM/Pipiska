import UIKit

class PreviewViewController: UIViewController {
  private let eventCollectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(EventCollectionViewCell.self, forCellWithReuseIdentifier: EventCollectionViewCell.id)
    collectionView.backgroundColor = .clear
    return collectionView
  }()
  
  let leftLabels = ["Manager home:", "Manager away:", "Stadium:", "Capacity:", "City:", "Country:"]
  let rightLabels = ["Manager home", "Manager away", "Stadium", "Capacity", "City", "Country"]
  
  let underDate: UIImageView = {
    let image = UIImage(named: "UnderStatDate")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let dateLabel: UILabel = {
    let label = UILabel()
    label.text = "20.02.2023 20:00"
    label.font = label.font.withSize(15)
    label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let firstLogo: UIImageView = {
    let image = UIImage(named: "ClubLogo")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let secondLogo: UIImageView = {
    let image = UIImage(named: "ClubLogo")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let firstName: UILabel = {
    let label = UILabel()
    label.text = "Team One"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let secondName: UILabel = {
    let label = UILabel()
    label.text = "Team Two"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let vsImage: UIImageView = {
    let image = UIImage(named: "VS")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let aboutEvent: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "UnderAboutEvent")
    button.setBackgroundImage(image, for: .normal)
    button.setTitle("About Event", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let openAboutEvent: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "OpenAboutEvent")
    button.setBackgroundImage(image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let openAboutEventView: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "OpenAboutEventContent")
    button.setBackgroundImage(image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    button.isEnabled = false
    return button
  }()
  
  let selfStat: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "UnderStatDetails")
    button.setBackgroundImage(image, for: .normal)
    button.setTitle("Self Stat", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let backTopBar: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Preview"
    view.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
    
    tabBarController?.tabBar.alpha = 0
    
    view.addSubview(backTopBar)
    
    //AboutMatch
    view.addSubview(underDate)
    view.addSubview(dateLabel)
    
    view.addSubview(firstLogo)
    view.addSubview(firstName)
    view.addSubview(secondLogo)
    view.addSubview(secondName)
    
    view.addSubview(vsImage)
    
    view.addSubview(aboutEvent)
    aboutEvent.addTarget(self, action: #selector(openAbout), for: .touchUpInside)
    view.addSubview(openAboutEvent)
    openAboutEvent.addTarget(self, action: #selector(closeAbout), for: .touchUpInside)
    view.addSubview(openAboutEventView)
    
    openAboutEvent.isHidden = true
    openAboutEventView.isHidden = true
    
    view.addSubview(selfStat)
    selfStat.addTarget(self, action: #selector(selfstat), for: .touchUpInside)
    
    view.addSubview(eventCollectionView)
    eventCollectionView.delegate = self
    eventCollectionView.dataSource = self
    eventCollectionView.isHidden = true

    makeConstraints()
  }
  
  @objc func selfstat() {
    let viewController = SelfStatViewController()
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  @objc func openAbout() {
    openAboutEvent.isHidden = false
    openAboutEventView.isHidden = false
    aboutEvent.isHidden = true
    eventCollectionView.isHidden = false
  }
  
  @objc func closeAbout() {
    openAboutEvent.isHidden = true
    openAboutEventView.isHidden = true
    aboutEvent.isHidden = false
    eventCollectionView.isHidden = true
  }
  
  private func makeConstraints() {
    NSLayoutConstraint.activate([
      backTopBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      backTopBar.leftAnchor.constraint(equalTo: view.leftAnchor),
      backTopBar.rightAnchor.constraint(equalTo: view.rightAnchor),
      backTopBar.topAnchor.constraint(equalTo: view.topAnchor),
      backTopBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      
      underDate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      underDate.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 10),
      
      dateLabel.centerYAnchor.constraint(equalTo: underDate.centerYAnchor),
      dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      firstLogo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48),
      firstLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
      
      firstName.topAnchor.constraint(equalTo: firstLogo.bottomAnchor, constant: 8),
      firstName.centerXAnchor.constraint(equalTo: firstLogo.centerXAnchor),
      
      secondLogo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -48),
      secondLogo.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 40),
      
      secondName.topAnchor.constraint(equalTo: secondLogo.bottomAnchor, constant: 8),
      secondName.centerXAnchor.constraint(equalTo: secondLogo.centerXAnchor),
      
      vsImage.topAnchor.constraint(equalTo: underDate.bottomAnchor, constant: 25),
      vsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      selfStat.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      selfStat.topAnchor.constraint(equalTo: firstName.bottomAnchor, constant: 50),
      
      aboutEvent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      aboutEvent.topAnchor.constraint(equalTo: selfStat.bottomAnchor, constant: 20),
      
      openAboutEvent.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      openAboutEvent.topAnchor.constraint(equalTo: selfStat.bottomAnchor, constant: 20),
      
      openAboutEventView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      openAboutEventView.topAnchor.constraint(equalTo: openAboutEvent.bottomAnchor),
      
      eventCollectionView.leftAnchor.constraint(equalTo: openAboutEventView.leftAnchor),
      eventCollectionView.rightAnchor.constraint(equalTo: openAboutEventView.rightAnchor),
      eventCollectionView.topAnchor.constraint(equalTo: openAboutEventView.topAnchor),
      eventCollectionView.bottomAnchor.constraint(equalTo: openAboutEventView.bottomAnchor, constant: -10)
    ])
  }
}

extension PreviewViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return 6
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EventCollectionViewCell.id, for: indexPath) as? EventCollectionViewCell
    else {
      fatalError("UnSupported")
    }
    
    
    cell.backgroundColor = .clear
    cell.leftLabel.text = leftLabels[indexPath.row]
    cell.rightLabel.text = rightLabels[indexPath.row]
    
    cell.configure()
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 30)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 2
  }

}
