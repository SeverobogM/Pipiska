import UIKit

class StatisticCollectionViewCell: UICollectionViewCell {
  static let id = "StatisticCollectionViewCellId"
  
  let statsPositionName: UILabel = {
    let label = UILabel()
    label.text = "StatPos"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let leftScore: UILabel = {
    let label = UILabel()
    label.text = "2"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let rightScore: UILabel = {
    let label = UILabel()
    label.text = "1"
    label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
    label.textAlignment = .center
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let greenRectangle: UIImageView = {
    let image = UIImage(named: "StatsRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(contentView)
    
    contentView.backgroundColor = #colorLiteral(red: 0.8797428608, green: 0.8797428012, blue: 0.8797428608, alpha: 1)
    contentView.addSubview(statsPositionName)
    contentView.addSubview(greenRectangle)
    
    contentView.addSubview(leftScore)
    contentView.addSubview(rightScore)
    
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
      
      statsPositionName.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      statsPositionName.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      greenRectangle.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      greenRectangle.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      
      leftScore.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      leftScore.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 30),
      
      rightScore.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      rightScore.leftAnchor.constraint(equalTo: contentView.rightAnchor, constant: -30),
    ])
  }
}


