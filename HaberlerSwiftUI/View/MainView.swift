//
//  ContentView.swift
//  HaberlerSwiftUI
//
//  Created by İbrahim Güler on 8.08.2021.
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var newsListViewModel : NewsListViewModel
    
    @State var searchingName = ""
    init() {
        self.newsListViewModel = NewsListViewModel()
        self.newsListViewModel.searchNewsForCountry()
    }
    var body: some View {
        NavigationView {
            VStack {
                TextField("Aranacak İsim", text: self.$searchingName, onEditingChanged: { _ in}, onCommit: {
                    if self.searchingName != "" {
                        self.newsListViewModel.searchNews(newsName: self.searchingName.trimmingCharacters(in: .whitespacesAndNewlines).addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) ?? self.searchingName)
                    }else {
                        self.newsListViewModel.searchNewsForCountry()
                    }
                }).padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
                
                List(self.newsListViewModel.news, id: \.id) { news in
                        VStack {
                            Text(news.title)
                                .font(.headline)
                                .lineLimit(1)
                            ImageView(url: news.urlToImage)
                            
                            HStack {
                                Text(news.publishedTime)
                                    .font(.caption2)
                                Spacer()
                                Text(news.publishedAt)
                                    .font(.caption)
                            }.padding()
                        }
                }.navigationTitle("News")
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
