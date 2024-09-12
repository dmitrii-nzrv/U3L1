//
//  NetworkManager.swift
//  lesson1
//
//  Created by Dmitrii Nazarov on 12.09.2024.
//

import Foundation

class NetworkManager{
    
    func sendRequest(q: String, limit: Int){
        
        //1 create URL
        var urlComponent = URLComponents()
        urlComponent.scheme = "https"
        urlComponent.host = "rickandmortyapi.com"
        urlComponent.path = "/api/character"
    
        urlComponent.queryItems = [
            URLQueryItem(name: "page", value: "1"),
        ]
        
        guard let url = urlComponent.url else { return }
        
        //2 Create Requst
        var request = URLRequest(url: url)
        
        //3 send requst
        URLSession.shared.dataTask(with: request) { data, responce, error in
            guard error == nil else {
                print(error!.localizedDescription)
                return
            }
        
            guard let data else { return }
            
            do {
                let result = try JSONDecoder().decode(Responce.self, from: data)

                result.results.forEach({ item in
                    print(item.name)
                    print(item.species)
                    print(item.gender)
                    print(item.origin.name)
                    print("======")
                    
                })
            } catch {
                print(error)
            }
            
        }.resume()
        
    }
    
}

//Model
struct Responce: Codable{
    //let totalResults: Int
    let results: [Articles]
}

struct Articles: Codable{
    let name: String?
    let species: String?
    let gender: String?
    let origin: Origin
}

struct Origin: Codable {
    let name: String?
}
