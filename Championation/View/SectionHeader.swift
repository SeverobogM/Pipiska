import UIKit

class SectionHeader: UICollectionReusableView {
  static let ReuseIdentifier = "SectionHeader"
  
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
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    addSubview(firstBigLogo)
    addSubview(firstName)
    
    makeConstraints()
  }
  
  required init?(coder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  private func makeConstraints() {
    NSLayoutConstraint.activate([
      firstBigLogo.centerXAnchor.constraint(equalTo: centerXAnchor),
      firstBigLogo.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
      
      firstName.centerXAnchor.constraint(equalTo: centerXAnchor),
      firstName.topAnchor.constraint(equalTo: firstBigLogo.bottomAnchor, constant: 5),
    ])
  }
}
