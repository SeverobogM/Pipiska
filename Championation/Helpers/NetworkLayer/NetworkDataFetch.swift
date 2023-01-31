//
//  NetworkDataFetch.swift
//  Water polo infogames
//
//  Created by Ramazan Abdulaev on 27.11.2022.
//

import Foundation

protocol NetworkDataFetchProtocol {
    
}

final class NetworkDataFetch {
    
    private var networkService = NetworkService()
    
    func fetchTournaments(completion: @escaping (Result<Tournaments, Error>) -> Void) {
        networkService.request(
            kinds: [KindData.uniqueTournaments],
            reqiredParams: [RequiredParameter(id: CommonData.shared.categoryId.stringValue,
                                              parameter: .categoryId)])
        { result in
            guard let result else { return }
            
            switch result {
            case .success(let data):
//                let str = String(decoding: data, as: UTF8.self)
//                print(str)
                let objects = self.decodeJSON(T: Tournaments.self, from: data)
                if let objects {
                    completion(.success(objects))
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
    }
    
    func fetchTeams(tournamentId: String, seasonId: String, completion: @escaping (Result<Teams, Error>) -> Void) {
        networkService.request(
            reqiredParams: [RequiredParameter(id: tournamentId, parameter: .uniqueTournamentId),
                            RequiredParameter(id: seasonId, parameter: .seasonId)],
            kindOf: .teams)
        { result in
            guard let result else { return }
            
            switch result {
            case .success(let data):
//                let str = String(decoding: data, as: UTF8.self)
//                print(str)
                let objects = self.decodeJSON(T: Teams.self, from: data)
                if let objects {
                    completion(.success(objects))
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
    }
    
    func fetchEvents(tournamentId: String, seasonId: String, completion: @escaping (Result<Events, Error>) -> Void) {
        networkService.request(
            version: .mobileV4,
            reqiredParams: [RequiredParameter(id: tournamentId, parameter: .uniqueTournamentId),
                                               RequiredParameter(id: seasonId, parameter: .seasonId)],
            kindOf: .events)
        { result in
            guard let result else { return }
            
            switch result {
            case .success(let data):
//                let str = String(decoding: data, as: UTF8.self)
//                print(str)
                let objects = self.decodeJSON(T: Events.self, from: data)
                if let objects {
                    completion(.success(objects))
                }
            case .failure(let error):
                print(error.localizedDescription)
                completion(.failure(error))
            }
            
        }
    }
    
    private func decodeJSON<T: Decodable>(T: T.Type, from: Data?) -> T? {
        let decoder = JSONDecoder()
        guard let data = from else { return nil }
        
        do {
            let objects = try decoder.decode(T.self, from: data)
            return objects
        } catch let error {
            print("Failed to decode JSON", error)
            return nil
        }
    }
    
}
