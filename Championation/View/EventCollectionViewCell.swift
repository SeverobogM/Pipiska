import UIKit

class EventCollectionViewCell: UICollectionViewCell {
  static let id = "EventCollectionViewCellId"
  
  let leftLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.text = "123"
    label.font = label.font.withSize(13)
    return label
  }()
  
  let rightLabel: UILabel = {
    let label = UILabel()
    label.translatesAutoresizingMaskIntoConstraints = false
    label.textColor = .black
    label.text = "123"
    label.font = label.font.withSize(13)
    return label
  }()
  
  let line: UIImageView = {
    let image = UIImage(named: "OpenAboutEventLine")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(contentView)
    
    contentView.addSubview(leftLabel)
    contentView.addSubview(rightLabel)
    contentView.addSubview(line)
    
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
      
      leftLabel.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 40),
      leftLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      rightLabel.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -40),
      rightLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      
      line.centerXAnchor.constraint(equalTo: contentView.centerXAnchor),
      line.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)
    ])
  }
}
