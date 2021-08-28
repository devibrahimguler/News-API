//
//  List.swift
//  HaberlerSwiftUI
//
//  Created by İbrahim Güler on 8.08.2021.
//

import SwiftUI

struct ListView: View {
    
    let newsListViewModel : NewsListViewModel
    
    var body: some View {
        NavigationView {
            
        }
    }
}

struct List_Previews: PreviewProvider {
    static var previews: some View {
        ListView(newsListViewModel: NewsListViewModel())
    }
}
