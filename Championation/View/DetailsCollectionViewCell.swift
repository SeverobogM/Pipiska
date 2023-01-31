import UIKit

class DetailsCollectionViewCell: UICollectionViewCell {
  static let id = "DetailsCollectionViewCellId"
  
  let verticalLine: UIButton = {
    let button = UIButton()
    button.backgroundColor = #colorLiteral(red: 0, green: 0.4091676474, blue: 0.3103775978, alpha: 1)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let underTimeEvent: UIButton = {
    let button = UIButton()
    button.backgroundColor = .white
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let timeEvent: UILabel = {
      let label = UILabel()
      label.text = "15"
      label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
  }()
  
  let eventLabel: UILabel = {
      let label = UILabel()
      label.text = "First team has scored"
      label.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
      label.textAlignment = .center
      label.translatesAutoresizingMaskIntoConstraints = false
      return label
  }()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(contentView)
    
    contentView.layer.borderWidth = 2
    contentView.layer.borderColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    
    contentView.addSubview(verticalLine)
    
    contentView.addSubview(underTimeEvent)
    contentView.addSubview(timeEvent)
    
    contentView.addSubview(eventLabel)
    
    makeConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  public func configure() {
  
  }
  
  private func makeConstraints() {
    NSLayoutConstraint.activate([
      verticalLine.leftAnchor.constraint(equalTo: contentView.leftAnchor, constant: 40),
      verticalLine.topAnchor.constraint(equalTo: contentView.topAnchor),
      verticalLine.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      verticalLine.rightAnchor.constraint(equalTo: contentView.rightAnchor, constant: -(contentView.frame.width-42)),
      
      underTimeEvent.leftAnchor.constraint(equalTo: contentView.leftAnchor),
      underTimeEvent.rightAnchor.constraint(equalTo: verticalLine.leftAnchor),
      underTimeEvent.topAnchor.constraint(equalTo: contentView.topAnchor),
      underTimeEvent.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
      
      timeEvent.centerYAnchor.constraint(equalTo: underTimeEvent.centerYAnchor),
      timeEvent.centerXAnchor.constraint(equalTo: underTimeEvent.centerXAnchor),
      
      eventLabel.centerYAnchor.constraint(equalTo: contentView.centerYAnchor),
      eventLabel.leftAnchor.constraint(equalTo: verticalLine.rightAnchor, constant: 10)
    ])
  }
  
}


