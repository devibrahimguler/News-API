//
//  ImageView.swift
//  HaberlerSwiftUI
//
//  Created by İbrahim Güler on 8.08.2021.
//

import SwiftUI

struct ImageView: View {
    
    let url : String
    @ObservedObject var imageDowloaderClient = ImageDownloaderClient()
    
    init(url : String) {
        self.url = url
        self.imageDowloaderClient.downloadingImage(url: self.url)
    }
    
    var body: some View {
        if let dataImage = self.imageDowloaderClient.dowloadedImage {
            return Image(uiImage: UIImage(data: dataImage)!)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        } else {
            return Image("placeholder")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .cornerRadius(5)
                .frame(width: UIScreen.main.bounds.width * 0.8, height: UIScreen.main.bounds.height * 0.2, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
        }
    }
}

struct ImageView_Previews: PreviewProvider {
    static var previews: some View {
        ImageView(url: "https://img-cdn.tnwcdn.com/image/hardfork?filter_last=1&fit=1280%2C640&url=https%3A%2F%2Fcdn0.tnwcdn.com%2Fwp-content%2Fblogs.dir%2F1%2Ffiles%2F2021%2F08%2FPitfalls-of-investing-in-cryptocurrency-Bitcoin-cash-dollars-hed.jpg&signature=964e59a9ab5be46a6aa1369fd8e14598")
    }
}
