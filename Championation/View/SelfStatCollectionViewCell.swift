import UIKit

class SelfStatCollectionViewCell: UICollectionViewCell {
  static let id = "SelfStatCollectionViewCellId"
  
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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(contentView)
    addSubview(firstName)
    addSubview(firstLogo)
    addSubview(secondName)
    addSubview(secondLogo)
    addSubview(scoreLabel)
    
    makeConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func configure() {
  
  }
  
  private func makeConstraints() {
    NSLayoutConstraint.activate([
      contentView.leftAnchor.constraint(equalTo: leftAnchor),
      contentView.rightAnchor.constraint(equalTo: rightAnchor),
      contentView.topAnchor.constraint(equalTo: topAnchor),
      contentView.bottomAnchor.constraint(equalTo: bottomAnchor),
      
      firstLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
      firstLogo.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 48),
      
      secondLogo.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 18),
      secondLogo.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -48),
      
      firstName.centerXAnchor.constraint(equalTo: firstLogo.centerXAnchor),
      firstName.topAnchor.constraint(equalTo: firstLogo.bottomAnchor, constant: 2),
      
      secondName.topAnchor.constraint(equalTo: secondLogo.bottomAnchor, constant: 2),
      secondName.centerXAnchor.constraint(equalTo: secondLogo.centerXAnchor),
      
      scoreLabel.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      scoreLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
  }
}
