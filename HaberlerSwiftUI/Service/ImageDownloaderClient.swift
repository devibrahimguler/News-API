//
//  ImageDownloaderClient.swift
//  HaberlerSwiftUI
//
//  Created by İbrahim Güler on 8.08.2021.
//

import Foundation

class ImageDownloaderClient : ObservableObject{
    @Published var dowloadedImage : Data?
    
    func downloadingImage(url : String) {
        guard let imageUrl = URL(string: url) else {
            return
        }
        
        URLSession.shared.dataTask(with: imageUrl) { data, response, error in
            guard let data = data, error == nil else {
                return
            }
            
            DispatchQueue.main.async {
                self.dowloadedImage = data
            }
        }.resume()
        
    }
}
