//
//  APIRequest.swift
//  MarvelCharacters
//
//  Created by Femer Garcia on 5/4/23.
//

import Foundation

class APIRequest {
    let url: URL
    
    init(url: URL) {
        self.url = url
    }
    
    func perform<T: Decodable>(with completion: @escaping (T?) -> Void) {
        let session = URLSession(configuration: .default, delegate: nil, delegateQueue: .main)
        let task = session.dataTask(with: url) { (data, _, _) in
            guard let data = data else {
                completion(nil)
                return
            }
            
            print(String(data: data, encoding: .utf8)!)
            
            let decoder = JSONDecoder()
            completion(try? decoder.decode(T.self, from: data))
        }
        task.resume()
    }
}
