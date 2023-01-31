import UIKit
import AVFoundation

class OptionViewController: UIViewController {

  let backgroundImage: UIImageView = {
    let image = UIImage(named: "OptionBackground")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let optionRectangle: UIImageView = {
    let image = UIImage(named: "OptionRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let soundLabel: UILabel = {
    let label = UILabel()
    label.text = "Sound"
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let automaticAdditionLabel: UILabel = {
    let label = UILabel()
    label.text = "Automatic Addition"
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let notificationLabel: UILabel = {
    let label = UILabel()
    label.text = "Notifications"
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let startPageLabel: UILabel = {
    let label = UILabel()
    label.text = "Start Page"
    label.textColor = .white
    label.translatesAutoresizingMaskIntoConstraints = false
    return label
  }()
  
  let soundOffButton: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "OffGrayButton")
    button.setBackgroundImage(image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let soundOnButton: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "OnGreenButton")
    button.setBackgroundImage(image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let automaticAdditionOffButton: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "OffGrayButton")
    button.setBackgroundImage(image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let automaticAdditionOnButton: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "OnGreenButton")
    button.setBackgroundImage(image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let notificationOffButton: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "OffGrayButton")
    button.setBackgroundImage(image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let notificationOnButton: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "OnGreenButton")
    button.setBackgroundImage(image, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let startPageSelector: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "StartPageSelector")
    button.setBackgroundImage(image, for: .normal)
    button.setTitle("Schedule", for: .normal)
    button.titleLabel?.font = button.titleLabel?.font.withSize(12)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let openStartPageSelector: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "OpenStartPageSelector")
    button.setBackgroundImage(image, for: .normal)
    button.setTitle("Schedule", for: .normal)
    button.titleLabel?.font = button.titleLabel?.font.withSize(12)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let openStartPageSelectorView: UIButton = {
    let button = UIButton()
    let image = UIImage(named: "OpenStartPageSelectorView")
    button.setBackgroundImage(image, for: .normal)
    button.isEnabled = false
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let selectedStartPage: UIButton = {
    let button = UIButton()
    button.setTitle("Selected", for: .normal)
    button.titleLabel?.font = button.titleLabel?.font.withSize(12)
    button.setTitleColor(.black, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let cupListStartPage: UIButton = {
    let button = UIButton()
    button.setTitle("Cup List", for: .normal)
    button.titleLabel?.font = button.titleLabel?.font.withSize(12)
    button.setTitleColor(.black, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let optionStartPage: UIButton = {
    let button = UIButton()
    button.setTitle("Option", for: .normal)
    button.titleLabel?.font = button.titleLabel?.font.withSize(12)
    button.setTitleColor(.black, for: .normal)
    button.translatesAutoresizingMaskIntoConstraints = false
    return button
  }()
  
  let lineOne: UIImageView = {
    let image = UIImage(named: "StartPageRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let lineTwo: UIImageView = {
    let image = UIImage(named: "StartPageRectangle")
    let imageView = UIImageView(image: image)
    imageView.translatesAutoresizingMaskIntoConstraints = false
    return imageView
  }()
  
  let pagePicker: UIPickerView = {
    let picker = UIPickerView()
    return picker
  }()

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    
    view.addSubview(backgroundImage)
    view.addSubview(optionRectangle)
    
    view.addSubview(soundLabel)
    view.addSubview(soundOffButton)
    view.addSubview(soundOnButton)
    soundOffButton.addTarget(self, action: #selector(soundOff), for: .touchUpInside)
    soundOnButton.addTarget(self, action: #selector(soundOn), for: .touchUpInside)
    
    view.addSubview(automaticAdditionLabel)
    view.addSubview(automaticAdditionOffButton)
    view.addSubview(automaticAdditionOnButton)
    automaticAdditionOffButton.addTarget(self, action: #selector(automaticAdditionOff), for: .touchUpInside)
    automaticAdditionOnButton.addTarget(self, action: #selector(automaticAdditionOn), for: .touchUpInside)
    
    view.addSubview(notificationLabel)
    view.addSubview(notificationOffButton)
    view.addSubview(notificationOnButton)
    notificationOffButton.addTarget(self, action: #selector(notificationsOff), for: .touchUpInside)
    notificationOnButton.addTarget(self, action: #selector(notificationsOn), for: .touchUpInside)
    
    view.addSubview(startPageLabel)
    view.addSubview(startPageSelector)
    startPageSelector.addTarget(self, action: #selector(startPagePicker), for: .touchUpInside)
    
    view.addSubview(openStartPageSelector)
    view.addSubview(openStartPageSelectorView)
    openStartPageSelector.addTarget(self, action: #selector(startPagePickerClose), for: .touchUpInside)
    
    openStartPageSelector.isHidden = true
    openStartPageSelectorView.isHidden = true
    
    view.addSubview(selectedStartPage)
    selectedStartPage.addTarget(self, action: #selector(selectedPageStart), for: .touchUpInside)
    view.addSubview(cupListStartPage)
    cupListStartPage.addTarget(self, action: #selector(cupListPageStart), for: .touchUpInside)
    view.addSubview(optionStartPage)
    optionStartPage.addTarget(self, action: #selector(optionPageStart), for: .touchUpInside)
    view.addSubview(lineOne)
    view.addSubview(lineTwo)
    
    selectedStartPage.isHidden = true
    lineOne.isHidden = true
    lineTwo.isHidden = true
    cupListStartPage.isHidden = true
    optionStartPage.isHidden = true
        
    makeConstraints()
  }
  
  @objc func soundOn() {
    let onImageGreen = UIImage(named: "OnGreenButton")
    let offImageGray = UIImage(named: "OffGrayButton")
    soundOnButton.setBackgroundImage(onImageGreen, for: .normal)
    soundOffButton.setBackgroundImage(offImageGray, for: .normal)
    AppDelegate.shared.volumeEnable = true
    AppDelegate.shared.buttonClickSound()
  }
  
  @objc func soundOff() {
    let onImageGray = UIImage(named: "OnGrayButton")
    let offImageGreen = UIImage(named: "OffGreenButton")
    soundOnButton.setBackgroundImage(onImageGray, for: .normal)
    soundOffButton.setBackgroundImage(offImageGreen, for: .normal)
    AppDelegate.shared.volumeEnable = false
    AppDelegate.shared.buttonClickSound()
  }
  
  @objc func automaticAdditionOn() {
    let onImageGreen = UIImage(named: "OnGreenButton")
    let offImageGray = UIImage(named: "OffGrayButton")
    automaticAdditionOnButton.setBackgroundImage(onImageGreen, for: .normal)
    automaticAdditionOffButton.setBackgroundImage(offImageGray, for: .normal)
    AppDelegate.shared.buttonClickSound()
  }
  
  @objc func automaticAdditionOff() {
    let onImageGray = UIImage(named: "OnGrayButton")
    let offImageGreen = UIImage(named: "OffGreenButton")
    automaticAdditionOnButton.setBackgroundImage(onImageGray, for: .normal)
    automaticAdditionOffButton.setBackgroundImage(offImageGreen, for: .normal)
    AppDelegate.shared.buttonClickSound()
  }
  
  @objc func notificationsOn() {
    let onImageGreen = UIImage(named: "OnGreenButton")
    let offImageGray = UIImage(named: "OffGrayButton")
    notificationOnButton.setBackgroundImage(onImageGreen, for: .normal)
    notificationOffButton.setBackgroundImage(offImageGray, for: .normal)
    AppDelegate.shared.buttonClickSound()
  }
  
  @objc func notificationsOff() {
    let onImageGray = UIImage(named: "OnGrayButton")
    let offImageGreen = UIImage(named: "OffGreenButton")
    notificationOnButton.setBackgroundImage(onImageGray, for: .normal)
    notificationOffButton.setBackgroundImage(offImageGreen, for: .normal)
    AppDelegate.shared.buttonClickSound()
  }
  
  @objc func startPagePicker() {
    AppDelegate.shared.buttonClickSound()
    
    openStartPageSelector.isHidden = false
    openStartPageSelectorView.isHidden = false
    startPageSelector.isHidden = true
    
    selectedStartPage.isHidden = false
    lineOne.isHidden = false
    lineTwo.isHidden = false
    cupListStartPage.isHidden = false
    optionStartPage.isHidden = false
  }
  
  @objc func selectedPageStart() {
    startPagePickerClose()
    startPageSelector.setTitle("Selected", for: .normal)
    selectIndex = 1
  }
  
  @objc func cupListPageStart() {
    startPagePickerClose()
    startPageSelector.setTitle("Cup List", for: .normal)
    selectIndex = 2
  }
  
  @objc func optionPageStart() {
    startPagePickerClose()
    startPageSelector.setTitle("Option", for: .normal)
    selectIndex = 3
  }
  
  @objc func startPagePickerClose() {
    AppDelegate.shared.buttonClickSound()
    
    if startPageSelector.titleLabel?.text != "Schedule" {
      startPageSelector.setTitle("Schedule", for: .normal)
      selectIndex = 0
    }
    openStartPageSelector.isHidden = true
    openStartPageSelectorView.isHidden = true
    startPageSelector.isHidden = false
    
    selectedStartPage.isHidden = true
    lineOne.isHidden = true
    lineTwo.isHidden = true
    cupListStartPage.isHidden = true
    optionStartPage.isHidden = true
  }
  
  func makeConstraints() {
    NSLayoutConstraint.activate([
      backgroundImage.leftAnchor.constraint(equalTo: view.leftAnchor),
      backgroundImage.rightAnchor.constraint(equalTo: view.rightAnchor),
      backgroundImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      backgroundImage.bottomAnchor.constraint(equalTo: view.bottomAnchor),
      
      optionRectangle.leftAnchor.constraint(equalTo: view.leftAnchor),
      optionRectangle.rightAnchor.constraint(equalTo: view.rightAnchor),
      optionRectangle.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
      optionRectangle.centerYAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerYAnchor),
      
      soundLabel.leftAnchor.constraint(equalTo: optionRectangle.leftAnchor, constant: 40),
      soundLabel.bottomAnchor.constraint(equalTo: automaticAdditionLabel.topAnchor, constant: -16),
      
      automaticAdditionLabel.leftAnchor.constraint(equalTo: optionRectangle.leftAnchor, constant: 40),
      automaticAdditionLabel.centerYAnchor.constraint(equalTo: optionRectangle.centerYAnchor, constant: -17),
      
      notificationLabel.leftAnchor.constraint(equalTo: optionRectangle.leftAnchor, constant: 40),
      notificationLabel.centerYAnchor.constraint(equalTo: optionRectangle.centerYAnchor, constant: 17),
      
      startPageLabel.leftAnchor.constraint(equalTo: optionRectangle.leftAnchor, constant: 40),
      startPageLabel.topAnchor.constraint(equalTo: notificationLabel.bottomAnchor, constant: 16),
      
      soundOffButton.rightAnchor.constraint(equalTo: optionRectangle.rightAnchor, constant: -40),
      soundOffButton.bottomAnchor.constraint(equalTo: automaticAdditionOffButton.topAnchor, constant: -13),
      
      soundOnButton.rightAnchor.constraint(equalTo: soundOffButton.leftAnchor, constant: -12),
      soundOnButton.bottomAnchor.constraint(equalTo: automaticAdditionOnButton.topAnchor, constant: -13),
      
      automaticAdditionOffButton.rightAnchor.constraint(equalTo: optionRectangle.rightAnchor, constant: -40),
      automaticAdditionOffButton.centerYAnchor.constraint(equalTo: optionRectangle.centerYAnchor, constant: -17),
      
      automaticAdditionOnButton.rightAnchor.constraint(equalTo: automaticAdditionOffButton.leftAnchor, constant: -12),
      automaticAdditionOnButton.centerYAnchor.constraint(equalTo: optionRectangle.centerYAnchor, constant: -17),
      
      notificationOffButton.rightAnchor.constraint(equalTo: optionRectangle.rightAnchor, constant: -40),
      notificationOffButton.centerYAnchor.constraint(equalTo: optionRectangle.centerYAnchor, constant: 17),
      
      notificationOnButton.rightAnchor.constraint(equalTo: notificationOffButton.leftAnchor, constant: -12),
      notificationOnButton.centerYAnchor.constraint(equalTo: optionRectangle.centerYAnchor, constant: 17),
      
      startPageSelector.rightAnchor.constraint(equalTo: optionRectangle.rightAnchor, constant: -40),
      startPageSelector.topAnchor.constraint(equalTo: notificationOnButton.bottomAnchor, constant: 13),
      
      openStartPageSelector.rightAnchor.constraint(equalTo: optionRectangle.rightAnchor, constant: -40),
      openStartPageSelector.topAnchor.constraint(equalTo: notificationOnButton.bottomAnchor, constant: 13),
      
      openStartPageSelectorView.rightAnchor.constraint(equalTo: optionRectangle.rightAnchor, constant: -40),
      openStartPageSelectorView.topAnchor.constraint(equalTo: openStartPageSelector.bottomAnchor),
      
      selectedStartPage.centerXAnchor.constraint(equalTo: openStartPageSelectorView.centerXAnchor),
      selectedStartPage.topAnchor.constraint(equalTo: openStartPageSelector.bottomAnchor, constant: -5),
      
      lineOne.centerXAnchor.constraint(equalTo: openStartPageSelectorView.centerXAnchor),
      lineOne.topAnchor.constraint(equalTo: selectedStartPage.bottomAnchor, constant: -3),
      
      cupListStartPage.centerXAnchor.constraint(equalTo: openStartPageSelectorView.centerXAnchor),
      cupListStartPage.topAnchor.constraint(equalTo: selectedStartPage.bottomAnchor, constant: -5),
      
      lineTwo.centerXAnchor.constraint(equalTo: openStartPageSelectorView.centerXAnchor),
      lineTwo.topAnchor.constraint(equalTo: cupListStartPage.bottomAnchor, constant: -3),
      
      optionStartPage.centerXAnchor.constraint(equalTo: openStartPageSelectorView.centerXAnchor),
      optionStartPage.topAnchor.constraint(equalTo: cupListStartPage.bottomAnchor, constant: -5),
    ])
  }
}
