//
//  Network.swift
//  Water polo infogames
//
//  Created by Ramazan Abdulaev on 28.11.2022.
//

import Foundation

public enum API: String {
    case login = "ayna"
    case token = "12784-OhJLY5mb3BSOx0O"
    case standartBaseUrlEn = "https://spoyer.com/api/en/get.php?login=ayna&token=12784-OhJLY5mb3BSOx0O"
    case standartBaseUrlRu = "https://spoyer.com/api/get.php?login=ayna&token=12784-OhJLY5mb3BSOx0O"
    case hui
    
    var baseUrl: String {
        if LocalizationSystem.sharedInstance.getLanguage() == "en" {
            return API.standartBaseUrlEn.rawValue
        } else {
            return API.standartBaseUrlRu.rawValue
        }
    }
}

protocol NetworkProtocol {
    var tournaments: [Tournament] { get }
    var didUpdateTournaments: (([Tournament]) -> Void)? { get set }
    func getTournaments()
    
    var teams: [Team] { get }
    var didUpdateTeams: (([Team]) -> Void)? { get set }
    func getTeams(by tournamentId: Int)
    
    var events: [Event] { get }
    var didUpdateEvents: (([Event]) -> Void)? { get set }
    func getEvents(by tournamentId: Int)
 
}

final class Network: NetworkProtocol {
    
    // MARK: - Singleton
    
    static let shared = Network()
    static let tournaments: [Tournament] = [
        Tournament(name: "Russian Premier League", slug: "", category: nil, id: 203),
        Tournament(name: "Premier League", slug: "", category: nil, id: 17),
        Tournament(name: "Bundesliga", slug: "", category: nil, id: 35),
        Tournament(name: "LaLiga", slug: "", category: nil, id: 8),
        Tournament(name: "Ligue 1", slug: "", category: nil, id: 34),
        Tournament(name: "Eredivise", slug: "", category: nil, id: 37),
    ]
    
    private init() {}
    
    // MARK: - Private constants
    
    private let seasons: [Int: Int] = [
        203 : 42388,
        17 : 41886,
        35 : 42268,
        8: 42409,
        34: 42273,
        37: 42256
    ]
    
    private let network = NetworkDataFetch()
    
    // MARK: - Protocol properties
    
    var didUpdateTournaments: (([Tournament]) -> Void)?
    var didUpdateTeams: (([Team]) -> Void)?
    var didUpdateEvents: (([Event]) -> Void)?
    
    
    private(set) var tournaments: [Tournament] = [] {
        didSet {
            didUpdateTournaments?(tournaments)
        }
    }
    
    private(set) var teams: [Team] = [] {
        didSet {
            didUpdateTeams?(teams)
        }
    }
    
    private(set) var events: [Event] = [] {
        didSet {
            didUpdateEvents?(events)
        }
    }
    
    // MARK: - Protocol methods
    
    func getTournaments() {
        if tournaments.isEmpty {
            
            network.fetchTournaments { [weak self] result in
                switch result {
                case .success(let tournaments):
                    self?.tournaments = tournaments.data
                case .failure(let error):
                    print(error.localizedDescription)
                }
            }
            
        } else {
            didUpdateTournaments?(tournaments)
        }
    }
    
    func getTeams(by tournamentId: Int) {
        guard let seasonId = seasons[tournamentId]
        else {
            print("hasntSeasonId")
            didUpdateTeams?(teams)
            return
        }
        
        network.fetchTeams(tournamentId: tournamentId.stringValue,
                                  seasonId: seasonId.stringValue)
        { [weak self] result in
            switch result {
            case .success(let teams):
                self?.teams = teams.teams
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    func getEvents(by tournamentId: Int) {
        guard let seasonId = seasons[tournamentId]
        else {
            print("hasntSeasonId")
            didUpdateEvents?(events)
            return
        }
        
        network.fetchEvents(tournamentId: tournamentId.stringValue,
                            seasonId: seasonId.stringValue)
        { [weak self] result in
            switch result {
            case .success(let events):
                self?.events = events.tournaments.first?.events ?? []
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
        
    }
    
    public func getMatches(completion: @escaping ([SquashGame]) -> Void, dateString: String = "today") {
        var games: [SquashGame] = []
        let urlNew = URL(
            string: "\(API.hui.baseUrl)&task=livedata&sport=soccer&day=\(dateString)"
        )
        var requestNew = URLRequest(url: urlNew!)
        requestNew.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: requestNew, completionHandler: { data, response, error -> Void in
            
            do {
                guard let data else { return }
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(SquashGames.self, from: data)
                
                games = responseModel.gamesLive
                completion(games)
                
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    public func getEndMatches(completion: @escaping ([SquashGame]) -> Void, dateString: String = "today") {
        var games: [SquashGame] = []
        let urlNew = URL(
            string: "\(API.hui.baseUrl)&task=enddata&sport=soccer&day=\(dateString)"
        )
        var requestNew = URLRequest(url: urlNew!)
        requestNew.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: requestNew, completionHandler: { data, response, error -> Void in
            
            do {
                guard let data else { return }
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(SquashGamesEnd.self, from: data)
                
                games = responseModel.gamesEnd
                completion(games)
                
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    private func hasLeague(leagues: [SquashData], id: String) -> Bool {
        for league in leagues {
            if league.id == id {
                return true
            }
        }
        return false
    }
    
    public func getLeagues(completion: @escaping ([SquashData]) -> Void) {
        var leagues: [SquashData] = []
        let urlNew = URL(
            string: "\(API.hui.baseUrl)&task=enddata&sport=squash&day=20230114"
        )
        var requestNew = URLRequest(url: urlNew!)
        requestNew.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: requestNew, completionHandler: { [weak self] data, response, error -> Void in
            
            do {
                guard let data else { return }
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(SquashGames.self, from: data)
                
                guard let self else { return }
                for game in responseModel.gamesLive {
                    if !self.hasLeague(leagues: leagues, id: game.league.id) {
                        leagues.append(game.league)
                    }
                }
                completion(leagues)
                
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
    public func getTeams(completion: @escaping ([SquashData]) -> Void) {
        var teams: [SquashData] = []
        let urlNew = URL(
            string: "\(API.hui.baseUrl)&task=enddata&sport=squash&day=20220203"
        )
        var requestNew = URLRequest(url: urlNew!)
        requestNew.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: requestNew, completionHandler: { data, response, error -> Void in
            
            do {
                guard let data else { return }
                let jsonDecoder = JSONDecoder()
                let responseModel = try jsonDecoder.decode(SquashGames.self, from: data)
                
                for game in responseModel.gamesLive {
                    teams.append(game.home)
                    teams.append(game.away)
                }
                completion(teams)
                
            } catch {
                print("JSON Serialization error")
            }
        }).resume()
    }
    
}
