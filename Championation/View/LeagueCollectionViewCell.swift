import UIKit

final class LeagueCollectionViewCell: UICollectionViewCell {
  static let id = "LeagueCollectionViewCellId"
  
  let backgroundImage: UIImageView = {
    let image = UIImage(named: "LeagueBackground")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let rightArrow: UIImageView = {
    let image = UIImage(named: "RightArrow")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let leagueCountry: UIImageView = {
      let image = UIImage(named: "0")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let leagueName: UILabel = {
    let label = UILabel()
    label.text = "Premier League"
    label.textColor = #colorLiteral(red: 0, green: 0.4091676474, blue: 0.3103775978, alpha: 1)
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(contentView)
    
    contentView.addSubview(backgroundImage)
    
    contentView.addSubview(rightArrow)
    contentView.addSubview(leagueCountry)
    contentView.addSubview(leagueName)
    
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
      
      backgroundImage.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      backgroundImage.rightAnchor.constraint(equalTo: contentView.rightAnchor),
      backgroundImage.topAnchor.constraint(equalTo: contentView.safeAreaLayoutGuide.topAnchor),
      backgroundImage.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      
      rightArrow.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -16),
      rightArrow.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      leagueCountry.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 20),
      leagueCountry.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      leagueName.leftAnchor.constraint(equalTo: leagueCountry.rightAnchor, constant: 10),
      leagueName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor)
    ])
  }
}
