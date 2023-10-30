//
//  ContentView.swift
//  CDL
//
//  Created by mathieu schneider on 30.09.23.
//

import SwiftUI
import SafariServices
import WebKit
import PassKit
import MessageUI
import UIKit
import Firebase

struct ContentView: View {
    @ObservedObject var viewModel = NewsViewModel()
    @State private var searchText = ""
    @State private var selectedCategory = ""
    @State private var showStudentIDCard = false
    @State private var webLink: String? = nil
    @State private var isChangeRequestPagePresented = false
    @State private var isEmailSheetPresented = false

    var body: some View {
        NavigationView {
            VStack {
                SearchBar(text: $searchText, placeholder: "Search News")

                CategoriesView(selectedCategory: $selectedCategory, categories: Array(Set(viewModel.articles.map { $0.category })), onCategorySelected: filterNewsByCategory)

                List(viewModel.filteredArticles) { article in
                    Button(action: {
                        webLink = article.url
                    }) {
                        NewsCardView(article: article)
                    }
                }
                .navigationTitle("World News")

                Spacer()

                HStack {
                    Button(action: {
                        showStudentIDCard.toggle()
                    }) {
                        Text("Show Student Card")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.yellow)
                            .cornerRadius(100)
                    }
                    .sheet(isPresented: $showStudentIDCard) {
                        StudentIDCardView()
                    }

                    Button(action: {
                        isEmailSheetPresented.toggle()
                    }) {
                        HStack {
                            Image(systemName: "exclamationmark.bubble.fill")
                                .font(.headline)
                                .foregroundColor(.white)
                            Text("Help")
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .padding(20)
                        .background(Color.blue)
                        .cornerRadius(100)
                    }
                    .sheet(isPresented: $isEmailSheetPresented) {
                        MailComposeView(recipients: ["mathieu_schneider@cdl.ch"], subject: "School Pass Help", messageBody: "")
                    }

                    Button(action: {
                        isChangeRequestPagePresented.toggle()
                    }) {
                        Image(systemName: "key.viewfinder")
                            .font(.system(size: 20))
                            .foregroundColor(.white)
                            .padding(20)
                            .background(Color.red)
                            .cornerRadius(100)
                    }
                    .sheet(isPresented: $isChangeRequestPagePresented) {
                        ChangeRequestDiscordPage()
                    }

                    Button(action: {
                        isEmailSheetPresented.toggle()
                    }) {
                        Text("")
                    }
                    .sheet(isPresented: $isEmailSheetPresented) {
                    }
                }
            }
            .onAppear {
                viewModel.fetchNews()
            }
        }
    }

    func filterNewsByCategory(_ category: String) {
        viewModel.filterArticlesByCategory(category)
        selectedCategory = category
    }
}
