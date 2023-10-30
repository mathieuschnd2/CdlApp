//
//  WebView.swift
//  CDL
//
//  Created by mathieu schneider on 30.10.23.
//

import Foundation
import WebKit
import SwiftUI

struct WebView: View {
    let urlString: String
    
    var body: some View {
        NavigationView {
            WebViewWrapper(urlString: urlString)
        }
    }
}

struct WebViewWrapper: UIViewRepresentable {
    let urlString: String
    
    func makeUIView(context: Context) -> WKWebView {
        let webView = WKWebView()
        return webView
    }
    
    func updateUIView(_ uiView: WKWebView, context: Context) {
        if let url = URL(string: urlString) {
            let request = URLRequest(url: url)
            uiView.load(request)
        }
    }
}
