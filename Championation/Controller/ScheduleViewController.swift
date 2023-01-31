import UIKit

final class ScheduleViewController: UIViewController {
    
    private var UpcomingGames: [SquashGame] = []
    private var PastGames: [SquashGame] = []
    private var league: SquashData
  
    
    private var isUpcoming = true
    
  var control: UISegmentedControl = {
    let segmentItems = ["Upcoming", "Past"]
    let control = UISegmentedControl(items: segmentItems)
    control.selectedSegmentTintColor = #colorLiteral(red: 0.9576455951, green: 0.8690345883, blue: 0.178919822, alpha: 1)
    control.backgroundColor = #colorLiteral(red: 0.5608567595, green: 0.4777524471, blue: 0.01233047713, alpha: 1)
    control.translatesAutoresizingMaskIntoConstraints = false
    control.selectedSegmentIndex = 0
    return control
  }()
  
  private let matchesCollectionView: UICollectionView = {
    let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout())
    collectionView.translatesAutoresizingMaskIntoConstraints = false
    collectionView.register(MatchCollectionViewCell.self, forCellWithReuseIdentifier: MatchCollectionViewCell.id)
    collectionView.backgroundColor = .clear
    return collectionView
  }()
    
    init(league: SquashData) {
        self.league = league
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
  override func viewWillAppear(_ animated: Bool) {
    super.viewWillAppear(animated)
    tabBarController?.tabBar.alpha = 1
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    view.backgroundColor = #colorLiteral(red: 0, green: 0.5759081841, blue: 0.4402300715, alpha: 1)
    
    view.addSubview(control)
    control.addTarget(self, action: #selector(segmentControl(_:)), for: .valueChanged)
    
    matchesCollectionView.delegate = self
    matchesCollectionView.dataSource = self
    view.addSubview(matchesCollectionView)
    
    makeConstraints()
      
      // get games
      let dateFormatter = DateFormatter()
      dateFormatter.dateFormat = "YYYYMMdd"
      let dateStr = dateFormatter.string(from: CommonData.shared.getYesterdayDate())

          Network.shared.getMatches(completion: { [weak self] games in
              DispatchQueue.main.async {
                  self?.UpcomingGames = games
                  print(self?.UpcomingGames)
                  self?.matchesCollectionView.reloadData()
              }
          }, dateString: "today")
      
      Network.shared.getEndMatches(completion: { [weak self] games in
          DispatchQueue.main.async {
              self?.PastGames = games

              
              print(self?.PastGames)
              self?.matchesCollectionView.reloadData()
          }
      }, dateString: "today")
  }
  
  @objc func segmentControl(_ sender: UISegmentedControl) {
    switch sender.selectedSegmentIndex {
      case 0:
        control.selectedSegmentIndex = 0
        isUpcoming.toggle()
        matchesCollectionView.reloadData()
      case 1:
        control.selectedSegmentIndex = 1
        isUpcoming.toggle()
        matchesCollectionView.reloadData()
      default:
        break
    }
  }
  
  @objc func statistic() {
    let viewController = StatisticViewController()
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  @objc func preview() {
    let viewController = PreviewViewController()
    navigationController?.pushViewController(viewController, animated: true)
  }
  
  func makeConstraints() {
    NSLayoutConstraint.activate([
      control.leftAnchor.constraint(equalTo: view.leftAnchor, constant: -10),
      control.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 10),
      control.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
      
      matchesCollectionView.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 0),
      matchesCollectionView.rightAnchor.constraint(equalTo: view.rightAnchor, constant: 0),
      matchesCollectionView.topAnchor.constraint(equalTo: control.bottomAnchor),
      matchesCollectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
    ])
  }

}

extension ScheduleViewController : UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
  
  func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
      if isUpcoming {
          return UpcomingGames.count
      } else {
          return PastGames.count - 4
      }
      
  }
  
  func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
    if control.selectedSegmentIndex == 1 {
      statistic()
    } else if control.selectedSegmentIndex == 0 {
      preview()
    }
  }
  
  func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
      guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MatchCollectionViewCell.id, for: indexPath) as? MatchCollectionViewCell else { return UICollectionViewCell() }
      if isUpcoming {
          cell.configure(match: UpcomingGames[indexPath.row], league: league)
      } else {
          cell.configure(match: PastGames[indexPath.row+3], league: league)
          if PastGames[indexPath.row+3].score != "" {
              cell.dateLabel.text = PastGames[indexPath.row+3].score
          } else {
              cell.dateLabel.text = "0:0"
          }
          cell.dateLabel.font = cell.dateLabel.font.withSize(25)
      }
      
      
    return cell
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
    return CGSize(width: view.frame.width, height: 120)
  }
  
  func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
    return 1
  }

}
