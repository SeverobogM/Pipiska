import UIKit

class StatisticViewController: UIViewController {
  
  private lazy var scrollView : UIScrollView =
  {
    let scrollView = UIScrollView()
    scrollView.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
    scrollView.frame = view.bounds
    scrollView.contentSize = contentSize
    
    return scrollView
  }()
  
  private lazy var contentView : UIView =
  {
    let contentView = UIView()
    contentView.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
    scrollView.frame.size = contentSize
    
    return contentView
  }()
  
  private var stackView : UIStackView =
  {
    let stackView = UIStackView()
    stackView.axis = .vertical
    stackView.alignment = .center
    stackView.spacing = 20
    stackView.translatesAutoresizingMaskIntoConstraints = false
    
    return stackView
  }()
  
  var contentSize : CGSize
  {
    CGSize(width: view.frame.width, height: view.frame.height + 500)
  }
  
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
  
  let attacksLabel: UILabel = {
    let label = UILabel()
    label.text = "Attacks"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let attackRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let ballSafeLabel: UILabel = {
    let label = UILabel()
    label.text = "Ball Safe"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let ballSafeRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let cornersLabel: UILabel = {
    let label = UILabel()
    label.text = "Corners"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let cornersRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let cornerFLabel: UILabel = {
    let label = UILabel()
    label.text = "Corner F"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let cornersFRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let cornerHLabel: UILabel = {
    let label = UILabel()
    label.text = "Corner H"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let cornersHRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let dangerousAttacksLabel: UILabel = {
    let label = UILabel()
    label.text = "Dangerous attacks"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let dangAttackRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let goalsLabel: UILabel = {
    let label = UILabel()
    label.text = "Goals"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let goalsRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let offTargetLabel: UILabel = {
    let label = UILabel()
    label.text = "Off target"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let offTargetRactangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let onTargetLabel: UILabel = {
    let label = UILabel()
    label.text = "On target"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let onTargetRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let penaltiesLabel: UILabel = {
    let label = UILabel()
    label.text = "Penalties"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let penaltiesRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let redCardsLabel: UILabel = {
    let label = UILabel()
    label.text = "Red cards"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let redCardsRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let substitutionsLabel: UILabel = {
    let label = UILabel()
    label.text = "Substitutions"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let substitutionsRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let yellowCardsLabel: UILabel = {
    let label = UILabel()
    label.text = "Yellow cards"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let yellowCardsRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let yellowRedCardsLabel: UILabel = {
    let label = UILabel()
    label.text = "Yellowred cards"
    label.textColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let posession: UIImageView = {
    let image = UIImage(named: "PossessionBall")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let field: UIButton = {
    let image = UIImage(named: "FootballField")
    let button = UIButton()
    button.setBackgroundImage(image, for: .normal)
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
    self.title = "Statistic"
    view.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
    
    tabBarController?.tabBar.alpha = 0
    
    addSubviews()
    makeConstraints()
  }
  
  private func addSubviews() {
    view.addSubview(scrollView)
    scrollView.addSubview(contentView)
    contentView.addSubview(stackView)
    
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
    
    //StatPositions
    view.addSubview(attacksLabel)
    view.addSubview(attackRectangle)
    
    view.addSubview(ballSafeLabel)
    view.addSubview(ballSafeRectangle)
    
    view.addSubview(cornersLabel)
    view.addSubview(cornersRectangle)
    
    view.addSubview(cornerFLabel)
    view.addSubview(cornersFRectangle)
    
    view.addSubview(cornerHLabel)
    view.addSubview(cornersHRectangle)
    
    view.addSubview(dangerousAttacksLabel)
    view.addSubview(dangAttackRectangle)
    
    view.addSubview(goalsLabel)
    view.addSubview(goalsRectangle)
    
    view.addSubview(offTargetLabel)
    view.addSubview(offTargetRactangle)
    
    view.addSubview(onTargetLabel)
    view.addSubview(onTargetRectangle)
    
    view.addSubview(penaltiesLabel)
    view.addSubview(penaltiesRectangle)
    
    view.addSubview(redCardsLabel)
    view.addSubview(redCardsRectangle)
    
    view.addSubview(substitutionsLabel)
    view.addSubview(substitutionsRectangle)
    
    view.addSubview(yellowCardsLabel)
    view.addSubview(yellowCardsRectangle)
    
    view.addSubview(yellowRedCardsLabel)

    //BallPossession
    view.addSubview(posession)
    view.addSubview(field)
  }
  
  @objc func detailsView() {
    let viewController = DetailsViewController()
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  private func makeConstraints() {
    NSLayoutConstraint.activate([
      stackView.topAnchor.constraint(equalTo: contentView.topAnchor),
      stackView.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      stackView.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      
      backTopBar.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      backTopBar.leftAnchor.constraint(equalTo: stackView.leftAnchor),
      backTopBar.rightAnchor.constraint(equalTo: stackView.rightAnchor),
      backTopBar.topAnchor.constraint(equalTo: view.topAnchor),
      backTopBar.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      
      underDate.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      underDate.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor, constant: 10),
      
      dateLabel.centerYAnchor.constraint(equalTo: underDate.centerYAnchor),
      dateLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      firstLogo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 48),
      firstLogo.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor, constant: 40),
      
      firstName.topAnchor.constraint(equalTo: firstLogo.bottomAnchor, constant: 8),
      firstName.centerXAnchor.constraint(equalTo: firstLogo.centerXAnchor),
      
      secondLogo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -48),
      secondLogo.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor, constant: 40),
      
      secondName.topAnchor.constraint(equalTo: secondLogo.bottomAnchor, constant: 8),
      secondName.centerXAnchor.constraint(equalTo: secondLogo.centerXAnchor),
      
      scoreLabel.centerYAnchor.constraint(equalTo: firstLogo.centerYAnchor),
      scoreLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      details.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      details.topAnchor.constraint(equalTo: stackView.safeAreaLayoutGuide.topAnchor, constant: 142),
      
      attacksLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      attacksLabel.topAnchor.constraint(equalTo: details.bottomAnchor, constant: 44),
      attackRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      attackRectangle.topAnchor.constraint(equalTo: attacksLabel.bottomAnchor, constant: 11),
      
      ballSafeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      ballSafeLabel.topAnchor.constraint(equalTo: attacksLabel.bottomAnchor, constant: 25),
      ballSafeRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      ballSafeRectangle.topAnchor.constraint(equalTo: ballSafeLabel.bottomAnchor, constant: 11),
      
      cornersLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cornersLabel.topAnchor.constraint(equalTo: ballSafeLabel.bottomAnchor, constant: 25),
      cornersRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cornersRectangle.topAnchor.constraint(equalTo: cornersLabel.bottomAnchor, constant: 11),
      
      cornerFLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cornerFLabel.topAnchor.constraint(equalTo: cornersLabel.bottomAnchor, constant: 25),
      cornersFRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cornersFRectangle.topAnchor.constraint(equalTo: cornerFLabel.bottomAnchor, constant: 11),
      
      cornerHLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cornerHLabel.topAnchor.constraint(equalTo: cornerFLabel.bottomAnchor, constant: 25),
      cornersHRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      cornersHRectangle.topAnchor.constraint(equalTo: cornerHLabel.bottomAnchor, constant: 11),
      
      dangerousAttacksLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      dangerousAttacksLabel.topAnchor.constraint(equalTo: cornerHLabel.bottomAnchor, constant: 25),
      dangAttackRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      dangAttackRectangle.topAnchor.constraint(equalTo: dangerousAttacksLabel.bottomAnchor, constant: 11),
      
      goalsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      goalsLabel.topAnchor.constraint(equalTo: dangerousAttacksLabel.bottomAnchor, constant: 25),
      goalsRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      goalsRectangle.topAnchor.constraint(equalTo: goalsLabel.bottomAnchor, constant: 11),
      
      offTargetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      offTargetLabel.topAnchor.constraint(equalTo: goalsLabel.bottomAnchor, constant: 25),
      offTargetRactangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      offTargetRactangle.topAnchor.constraint(equalTo: offTargetLabel.bottomAnchor, constant: 11),
      
      onTargetLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      onTargetLabel.topAnchor.constraint(equalTo: offTargetLabel.bottomAnchor, constant: 25),
      onTargetRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      onTargetRectangle.topAnchor.constraint(equalTo: onTargetLabel.bottomAnchor, constant: 11),
      
      penaltiesLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      penaltiesLabel.topAnchor.constraint(equalTo: onTargetLabel.bottomAnchor, constant: 25),
      penaltiesRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      penaltiesRectangle.topAnchor.constraint(equalTo: penaltiesLabel.bottomAnchor, constant: 11),
      
      redCardsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      redCardsLabel.topAnchor.constraint(equalTo: penaltiesLabel.bottomAnchor, constant: 25),
      redCardsRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      redCardsRectangle.topAnchor.constraint(equalTo: redCardsLabel.bottomAnchor, constant: 11),
      
      substitutionsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      substitutionsLabel.topAnchor.constraint(equalTo: redCardsLabel.bottomAnchor, constant: 25),
      substitutionsRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      substitutionsRectangle.topAnchor.constraint(equalTo: substitutionsLabel.bottomAnchor, constant: 11),
      
      yellowCardsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      yellowCardsLabel.topAnchor.constraint(equalTo: substitutionsLabel.bottomAnchor, constant: 25),
      yellowCardsRectangle.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      yellowCardsRectangle.topAnchor.constraint(equalTo: yellowCardsLabel.bottomAnchor, constant: 11),
      
      yellowRedCardsLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      yellowRedCardsLabel.topAnchor.constraint(equalTo: yellowCardsLabel.bottomAnchor, constant: 25),
      
      posession.topAnchor.constraint(equalTo: yellowRedCardsLabel.bottomAnchor, constant: 44),
      posession.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      
      field.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      field.topAnchor.constraint(equalTo: posession.bottomAnchor, constant: 20)
    ])
  }
    
}
