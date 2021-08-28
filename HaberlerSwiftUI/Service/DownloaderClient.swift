//
//  DownloaderClient.swift
//  HaberlerSwiftUI
//
//  Created by İbrahim Güler on 8.08.2021.
//

import Foundation

class DownloaderClient {
    
    func downloadsNews(search : String, completion : @escaping (Result<[News]?, DownloadError>)-> Void){
        guard let url = URL(string: "https://newsapi.org/v2/everything?q=\(search)&apiKey=69a164d212884d2a83ca52c14b34890b") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.dontCatchData))
            }
            
            guard let newsResponse = try? JSONDecoder().decode(IncomingNews.self, from: data) else {
                return completion(.failure(.dontHandleData))
            }
            
            completion(.success(newsResponse.newsList))
        }.resume()
    }
    
    
    func downloadsNewsForCountry(completion : @escaping (Result<[News]?, DownloadError>)-> Void){
        guard let url = URL(string: "https://newsapi.org/v2/top-headlines?country=tr&apiKey=69a164d212884d2a83ca52c14b34890b") else {
            return completion(.failure(.wrongUrl))
        }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                return completion(.failure(.dontCatchData))
            }
            
            guard let newsResponse = try? JSONDecoder().decode(IncomingNews.self, from: data) else {
                return completion(.failure(.dontHandleData))
            }
            
            completion(.success(newsResponse.newsList))
        }.resume()
    }
}

enum DownloadError : Error{
    case wrongUrl
    case dontCatchData
    case dontHandleData
}
