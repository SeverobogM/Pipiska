//
//  Network.swift
//  Total control Football
//
//  Created by Ramazan Abdulaev on 27.10.2022.
//

import Foundation

protocol NetworkLayerProtocol {
    func request(
        method: RequestMethod,
        host: String,
        version: Versions,
        reqiredParams: [RequiredParameter],
        kindOf: KindData,
        completion: @escaping (Result<Data, Error>?) -> Void
    )
    
    func request(
        method: RequestMethod,
        host: String,
        version: Versions,
        kinds: [KindData],
        reqiredParams: [RequiredParameter],
        completion: @escaping (Result<Data, Error>?) -> Void
    )
}

final class NetworkService: NetworkLayerProtocol {
    
    // MARK: Request for rapidApi(sofaSport) with headers and using queries as required parameters(hard limit: 500 request per month)
    func request(
        method: RequestMethod = .get,
        host: String = "sofasport.p.rapidapi.com",
        version: Versions = .v1,
        kinds: [KindData],
        reqiredParams: [RequiredParameter],
        completion: @escaping (Result<Data, Error>?) -> Void
    ) {
        let params = prepareQueries(kinds, reqiredParams, version)
        let url = self.url(host: host, path: params.0, params: params.1)
        guard let url else {
            completion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.allHTTPHeaderFields = prepareHeader()
        request.httpMethod = method.rawValue
        let task = createDataTask(with: request, completion: completion)
        task.resume()
    }
    
    // MARK: Request for free sofasport api without headers
    func request(
        method: RequestMethod = .get,
        host: String = "api.sofascore.com",
        version: Versions = .apiV1,
        reqiredParams: [RequiredParameter],
        kindOf: KindData,
        completion: @escaping (Result<Data, Error>?) -> Void
    ) {
        let path = preparePath(reqiredParams, kindOf.rawValue, version)
        let url = self.url(host: host, path: path, params: nil)
        guard let url else {
            completion(nil)
            return
        }
        var request = URLRequest(url: url)
        request.httpMethod = method.rawValue
        let task = createDataTask(with: request, completion: completion)
        task.resume()
    }
    
    private func prepareQueries(
        _ kinds: [KindData],
        _ requredParams: [RequiredParameter],
        _ version: Versions
    ) -> (String, [String: String]) {
        var path = version.rawValue
        for kind in kinds {
            path += kind.rawValue
        }
        var params = [String: String]()
        for param in requredParams {
            params[param.parameter.rawValue] = param.id
        }
        return (path, params)
    }
    
    private func preparePath(
        _ requredParams: [RequiredParameter],
        _ kind: String,
        _ version: Versions
    ) -> String {
        var path = version.rawValue
        for param in requredParams {
            path += param.path
        }
        path += kind
        return path
    }
    
    private func prepareHeader() -> [String: String]? {
        var headers = [String: String]()
        headers["X-RapidAPI-Key"] = "4285c27d30mshe59b4a62203c863p13caa5jsn6d86f11779ba"
        headers["X-RapidAPI-Host"] =  "sofasport.p.rapidapi.com"
        return headers
    }
    
    private func url(host: String, path: String, params: [String: String]?) -> URL? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = host
        components.path = path
        if let params {
            components.queryItems = params.map { URLQueryItem(name: $0, value: $1) }
        }
        return components.url
    }
    
    private func createDataTask(
        with request: URLRequest,
        completion: @escaping (Result<Data, Error>?) -> Void
    ) -> URLSessionDataTask {
        return URLSession.shared.dataTask(with: request) { (data, response, error) in
            DispatchQueue.main.async {
                
                if let error = error {
                    completion(.failure(error))
                } else if let data = data {
                    completion(.success(data))
                }
                
            }
        }
    }
    
    
}
