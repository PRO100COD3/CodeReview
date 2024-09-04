//
//  WebViewModel.swift
//  WebProject
//
//  Created by Вадим Дзюба on 04.09.2024.
//

import Foundation
import Combine
import SwiftUI
import WebKit

class WebViewModel: NSObject, ObservableObject {
    @Published var isLoading: Bool = true
    @Published var url: URL
    
    private var webView: WKWebView?
    
    init(url: URL) {
        self.url = url
    }
    
    func loadWebView(_ webView: WKWebView) {
        let request = URLRequest(url: url)
        webView.load(request)
    }
    
    func setupWebView(_ webView: WKWebView) {
        self.webView = webView
        webView.navigationDelegate = self
        webView.allowsBackForwardNavigationGestures = true
        webView.scrollView.isScrollEnabled = true
        webView.isOpaque = false
        webView.backgroundColor = .clear
    }
}

extension WebViewModel: WKNavigationDelegate {
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        isLoading = true
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        isLoading = false
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        isLoading = false
        print("Error during navigation: \(error.localizedDescription)")
    }
    
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        isLoading = false
        if (error as NSError).code != NSURLErrorCancelled {
            print("Error during provisional navigation: \(error.localizedDescription)")
        }
    }
}
