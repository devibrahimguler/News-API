//
//  News.swift
//  HaberlerSwiftUI
//
//  Created by İbrahim Güler on 8.08.2021.
//

import Foundation

struct News: Codable, Identifiable{
    
    var id = UUID()
    let author : String?
    let title : String?
    let description : String?
    let url : String?
    let urlToImage : String?
    let publishedAt : String?
    let content : String?
    
    private enum CodingKeys : String, CodingKey {
        case author = "author"
        case title = "title"
        case description = "description"
        case url = "url"
        case urlToImage = "urlToImage"
        case publishedAt = "publishedAt"
        case content = "content"
    }
    
}

struct IncomingNews : Codable {
    
    let newsList : [News]
    
    private enum CodingKeys : String, CodingKey {
        case newsList = "articles"
    }
    
}

