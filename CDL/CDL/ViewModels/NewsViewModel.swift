//
//  NewsViewModel.swift
//  CDL
//
//  Created by mathieu schneider on 30.10.23.
//

import Foundation
class NewsViewModel: ObservableObject {
    @Published var articles: [NewsArticle] = []
    @Published var filteredArticles: [NewsArticle] = []
    
    init() {
        fetchNews()
    }
    
    func fetchNews() {
        // You can add your own logic to fetch news articles here.
        // For this example, we'll use some sample data.
        let sampleArticles = [
            NewsArticle(title: "Breaking News", description: "Ukrainian forces have broken through in Verbove, top general says", url:"bit.ly/3EW30Hr", category: "Breaking News", category2:"all"),
            NewsArticle(title: "Biden announces the creation of first White House Office of Gun Violence Prevention to be led by Harris", description: "The president said it is time to ‘ban assault weapons’ during his speech", url:"https://bit.ly/46oH0ke", category: "Politics", category2:"all"),
        ]
        
        articles = sampleArticles
        filteredArticles = sampleArticles
    }
    
    func filterArticlesBySearch(_ searchText: String) {
        if searchText.isEmpty {
            filteredArticles = articles
        } else {
            filteredArticles = articles.filter { $0.title.lowercased().contains(searchText.lowercased()) }
        }
    }
    
    func filterArticlesByCategory(_ category: String) {
        if category.isEmpty {
            filteredArticles = articles
        } else {
            filteredArticles = articles.filter { $0.category == category }
        }
    }
}

