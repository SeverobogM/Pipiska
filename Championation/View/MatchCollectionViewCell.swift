import UIKit

final class MatchCollectionViewCell: UICollectionViewCell {
  static let id = "MatchCollectionViewCellId"
  
  let imageGray = UIImage(named: "SelectedGray")
  let imageGreen = UIImage(named: "SelectedGreen")
  
  let backgroundImage: UIImageView = {
    let image = UIImage(named: "MatchBackground")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let vsImage: UIImageView = {
    let image = UIImage(named: "VS")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
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
      label.numberOfLines = 0
      label.font = label.font.withSize(13)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let secondName: UILabel = {
    let label = UILabel()
    label.text = "Team Two"
      label.numberOfLines = 0
      label.font = label.font.withSize(13)
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let dateLabel: UILabel = {
    var label = UILabel()
    label.text = "20.02.2023"
    label.font = label.font.withSize(20)
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let isSelectedButton: UIButton = {
    let button = UIButton()
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubviews()
    makeConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
    func configure(match: SquashGame, league: SquashData) {
        let date = Date(timeIntervalSince1970: Double(match.time)!)
            let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.short //Set time style
            dateFormatter.dateStyle = DateFormatter.Style.short //Set date style
            dateFormatter.timeZone = .current
            let localDate = dateFormatter.string(from: date)
        let components = localDate.components(separatedBy: " at ")
        
        firstName.text = match.home.name
        secondName.text = match.away.name
        dateLabel.text = components[0]
    }
  
  private func addSubviews() {
    addSubview(contentView)
    contentView.addSubview(backgroundImage)
    contentView.addSubview(vsImage)
    contentView.addSubview(firstLogo)
    contentView.addSubview(secondLogo)
    contentView.addSubview(firstName)
    contentView.addSubview(secondName)
    contentView.addSubview(dateLabel)
//    contentView.addSubview(timeLabel)
    contentView.addSubview(isSelectedButton)
    isSelectedButton.setBackgroundImage(imageGray, for: .normal)
    isSelectedButton.addTarget(self, action: #selector(selected), for: .touchUpInside)
  }
  
  @objc func selected() {
    if isSelectedButton.backgroundImage(for: .normal) == imageGray {
      isSelectedButton.setBackgroundImage(imageGreen, for: .normal)
      AppDelegate.shared.selectedCount += 1
      print(AppDelegate.shared.selectedCount)
    } else {
      isSelectedButton.setBackgroundImage(imageGray, for: .normal)
      AppDelegate.shared.selectedCount -= 1
      print(AppDelegate.shared.selectedCount)
    }

  }
  
  private func makeConstraints() {
    NSLayoutConstraint.activate([
      contentView.leftAnchor.constraint(equalTo: leftAnchor),
      contentView.rightAnchor.constraint(equalTo: rightAnchor),
      contentView.topAnchor.constraint(equalTo: topAnchor),
      contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      backgroundImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      backgroundImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      backgroundImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      
      vsImage.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      vsImage.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      firstLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
      firstLogo.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 48),
      
      secondLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
      secondLogo.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -48),
      
      firstName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19),
      firstName.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 2),
      
      secondName.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -19),
      secondName.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -2),
      
      dateLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 33),
      dateLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      
//      timeLabel.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -33),
//      timeLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      
      isSelectedButton.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -10),
      isSelectedButton.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 10),
    ])
  }
  

}
