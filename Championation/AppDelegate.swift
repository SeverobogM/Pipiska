import UIKit
import AVFAudio

let myTabBar = TabBarController()
var selectIndex = 0

@main
class AppDelegate: UIResponder, UIApplicationDelegate
{
  var window : UIWindow?
  
  var selectedCount = 0
  
  class var shared: AppDelegate {
    return UIApplication.shared.delegate as! AppDelegate
  }
  
  //let sound = URL(fileURLWithPath: Bundle.main.path(forResource: "ButtonClick", ofType: "mp3")!)
  var audioPlayer: AVAudioPlayer?
  var volumeEnable = true

  func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool
  {
    window = UIWindow(frame: UIScreen.main.bounds)
    myTabBar.selectedIndex = selectIndex
    window?.rootViewController = myTabBar
    window?.makeKeyAndVisible()
    window?.overrideUserInterfaceStyle = .dark
    
    return true
  }
  
  func playAudioFile() {
    if volumeEnable {
    guard let url = Bundle.main.url(forResource: "ButtonClick", withExtension: "mp3") else { return }
      
    do {
      try AVAudioSession.sharedInstance().setCategory(AVAudioSession.Category.playback)
      try AVAudioSession.sharedInstance().setActive(true)
              
      audioPlayer = try AVAudioPlayer(contentsOf: url)
              
      guard let aPlayer = audioPlayer else { return }
      aPlayer.play()
          
      } catch let error {
        print(error.localizedDescription)
      }
      } else {
        return
      }
  }
}

