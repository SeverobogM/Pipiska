import UIKit

class StatisticViewController: UIViewController {
  let statsArray = ["Attacks", "Ball Safe","Corners","CornerF","CornerH","Dangerous attacks","Goals","On target","Off target", "Penalties", "Red cards", "Substitutions", "Yellow cards", "Yellowred cards"]
  
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
  
  let scoreLabel: UILabel = {
    let label = UILabel()
    label.text = "2 : 1"
    label.font = label.font.withSize(40)
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let details: UIButton = {
    let image = UIImage(named: "UnderStatDetails")
    let button = UIButton()
    button.setBackgroundImage(image, for: .normal)
    button.setTitle("Details", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  private let statisticCollectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(StatisticCollectionViewCell.self, forCellWithReuseIdentifier: StatisticCollectionViewCell.id)
    collectionView.backgroundColor = .clear
    return collectionView
  }()
  
  let posession: UIImageView = {
    let image = UIImage(named: "PossessionBall")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let field: UIImageView = {
    let image = UIImage(named: "FootballField")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let firstPossession = 50
  
  let posessionView: UIImageView = {
    let image = UIImage(named: "PossessionView")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let posessionLeft: UIButton = {
    let image = UIImage(named: "UnderPossession")
    let button = UIButton()
    button.isEnabled = false
    button.setBackgroundImage(image, for: .normal)
    button.setTitle("50", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let posessionRight: UIButton = {
    let image = UIImage(named: "UnderPossession")
    let button = UIButton()
    button.isEnabled = false
    button.setBackgroundImage(image, for: .normal)
    button.setTitle("50", for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.title = "Statistic"
    view.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
    
    var secondPossession = 100 - firstPossession
    
    tabBarController?.tabBar.alpha = 0
    
    view.addSubview(button)
    view.addSubview(backTopBar)
    
    view.addSubview(underDate)
    view.addSubview(dateLabel)
    
    view.addSubview(firstLogo)
    view.addSubview(firstName)
    view.addSubview(secondLogo)
    view.addSubview(secondName)
    view.addSubview(scoreLabel)
    view.addSubview(details)
    details.addTarget(self, action: #selector(detailsView), for: .touchUpInside)
    
    view.addSubview(posession)
    view.addSubview(field)
    view.addSubview(posessionView)
    view.addSubview(posessionLeft)
    posessionLeft.setTitle("\(firstPossession)%", for: .normal)
    view.addSubview(posessionRight)
    posessionRight.setTitle("\(secondPossession)%", for: .normal)
    
    statisticCollectionView.delegate = self
    statisticCollectionView.dataSource = self
    view.addSubview(statisticCollectionView)
    
    makeConstraints()
  }
  
  @objc func detailsView() {
    let viewController = DetailsViewController()
    navigationController?.pushViewController(viewController, animated: true)
    AppDelegate.shared.buttonClickSound()
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
      
      scoreLabel.centerYAnchor.constraint(equalTo: firstLogo.centerYAnchor),
      scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      details.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      details.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 142),
      
      field.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      field.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
      
      posession.bottomAnchor.constraint(equalTo: field.topAnchor, constant: -20),
      posession.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      statisticCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
      statisticCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
      statisticCollectionView.topAnchor.constraint(equalTo: details.bottomAnchor, constant: 20),
      statisticCollectionView.bottomAnchor.constraint(equalTo: posession.topAnchor, constant: -20),
      
      posessionView.leftAnchor.constraint(equalTo: field.leftAnchor),
      posessionView.bottomAnchor.constraint(equalTo: field.bottomAnchor),
      posessionView.topAnchor.constraint(equalTo: field.topAnchor),
      //posessionView.rightAnchor.constraint(equalTo: field.rightAnchor, constant: <#T##CGFloat#>),
      
      posessionLeft.centerYAnchor.constraint(equalTo: field.centerYAnchor),
      posessionLeft.leftAnchor.constraint(equalTo: field.leftAnchor, constant: 40),
      
      posessionRight.centerYAnchor.constraint(equalTo: field.centerYAnchor),
      posessionRight.rightAnchor.constraint(equalTo: field.rightAnchor, constant: -40)
    ])
  }
  
  func checkPossession () {
    
  }
    
}

extension StatisticViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
    return statsArray.count
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
    guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: StatisticCollectionViewCell.id, for: indexPath) as? StatisticCollectionViewCell
    else {
      fatalError("UnSupported")
    }
    
    cell.statsPositionName.text = statsArray[indexPath.row]
    
    cell.configure()
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 40)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }

}
