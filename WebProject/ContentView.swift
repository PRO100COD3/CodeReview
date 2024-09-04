//
//  ContentView.swift
//  WebProject
//
//  Created by Вадим Дзюба on 04.09.2024.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var webViewModel = WebViewModel(url: URL(string: "https://jobs.yourcodereview.com")!)
    
    var body: some View {
        ZStack {
            WebView(viewModel: webViewModel)
                .onAppear {
                    if let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
                        for window in windowScene.windows {
                            window.overrideUserInterfaceStyle = .light
                        }
                    }
                }
            
            if webViewModel.isLoading {
                ProgressView("Loading...")
                    .progressViewStyle(CircularProgressViewStyle())
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(Color.white.opacity(0.8))
            }
        }
        .edgesIgnoringSafeArea(.all)
    }
}
