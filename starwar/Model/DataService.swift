//
//  DataService.swift
//  starwar
//
//  Created by seintsan on 2/6/20.
//  Copyright © 2020 seintsan. All rights reserved.
//

import Foundation

class DataService {
    static let shared = DataService()
    fileprivate let basedURLString = "https://swapi.dev/api/"
    
    func createURLComponents(path : String) -> URLComponents {
        var component = URLComponents()
        component.scheme = "https"
        component.host = "swapi.dev"
        component.path = path
        return component
    }
    
    func fetchPlanets(completion: @escaping (Result<PlanetsResponse,Error>)-> Void )  {
        
        let component = createURLComponents(path: "/api/planets/")
        guard let composedURL = component.url else {
            print("URL creation failed...")
                       return
        }
        URLSession.shared.dataTask(with: composedURL){ (data,response ,error) in
            
            if let httpResponse = response as? HTTPURLResponse {
                print("API status: \(httpResponse.statusCode)")

            }
            
            guard let validData = data ,error == nil else {
                completion(.failure(error!))
                return
            }
            
            do {
                let planets = try JSONDecoder().decode(PlanetsResponse.self, from: validData)
                completion(.success(planets))

            }catch let serializationError {
                completion(.failure(serializationError))
            }
        }.resume()
    }
    
    func fetchFilms(completion: @escaping (Result<FilmsResponse,Error>)-> Void )  {
           
           let component = createURLComponents(path: "/api/films/")
           guard let composedURL = component.url else {
               print("URL creation failed...")
                          return
           }
           URLSession.shared.dataTask(with: composedURL){ (data,response ,error) in
               
               if let httpResponse = response as? HTTPURLResponse {
                   print("API status: \(httpResponse.statusCode)")

               }
               
               guard let validData = data ,error == nil else {
                   completion(.failure(error!))
                   return
               }
               
               do {
                   let films = try JSONDecoder().decode(FilmsResponse.self, from: validData)
                   completion(.success(films))

               }catch let serializationError {
                   completion(.failure(serializationError))
               }
           }.resume()
       }
}
