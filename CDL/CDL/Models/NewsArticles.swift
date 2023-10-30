//
//  NewsArticles.swift
//  CDL
//
//  Created by mathieu schneider on 30.10.23.
//
import Foundation

struct NewsArticle: Identifiable {
    let id = UUID()
    let title: String
    let description: String
    let url: String
    let category: String
    let category2: String
}
