//
//  NewsViewModel.swift
//  HaberlerSwiftUI
//
//  Created by İbrahim Güler on 8.08.2021.
//

import Foundation
import SwiftUI

class NewsListViewModel : ObservableObject {

    @Published var news = [NewsViewModel]()
    
    let downloaderClient = DownloaderClient()
    
    func searchNews(newsName : String) {
        downloaderClient.downloadsNews(search: newsName) { sonuc in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let newsArray):
                if let newsArray = newsArray {
                    DispatchQueue.main.async {
                        self.news = newsArray.map(NewsViewModel.init)
                    }
                }
            }
        }
    }
    
    func searchNewsForCountry() {
        downloaderClient.downloadsNewsForCountry { sonuc in
            switch sonuc {
            case .failure(let hata):
                print(hata)
            case .success(let newsArray):
                if let newsArray = newsArray {
                    DispatchQueue.main.async {
                        self.news = newsArray.map(NewsViewModel.init)
                    }
                }
            }
        }
    }
}

struct NewsViewModel {
    
    let news : News
    
    var id : UUID {
        news.id
    }
    var author : String{
        news.author ?? "Author"
    }
    var title : String {
        news.title ?? "Title"
    }
    var description : String {
        news.description ?? "Description"
    }
    var url : String {
        news.url ?? "Url"
    }
    var urlToImage : String {
        news.urlToImage ?? "Url To Image"
    }
    var publishedAt : String {
        if let splitDate = news.publishedAt?.split(whereSeparator: {$0 == "T"}).map(String.init) {
            return splitDate[0]
        }else {
            return news.publishedAt ?? "Published At"
        }
    }
    
    var publishedTime : String {
        if let splitDate = news.publishedAt?.split(whereSeparator: {$0 == "T"}).map(String.init) {
            return splitDate[1].replacingOccurrences(of: "Z", with: "")
        }else {
            return news.publishedAt ?? "Published At"
        }
    }
    var content : String {
        news.content ?? "Content"
    }
}
