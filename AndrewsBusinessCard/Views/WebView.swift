//
//  WebView.swift
//  AndrewsBusinessCard
//
//  Created by Andrew Olson on 1/19/23.
//

import WebKit
import SwiftUI

extension View {
    func toAnyView() -> AnyView {
        AnyView(self)
    }
}
struct SwiftUIWebView: UIViewRepresentable {
    
    @Binding var isLoading: Bool
    var url: String
    
    func makeUIView(context: Context) -> some UIView {
        let webView:WKWebView = WKWebView(frame: .zero)
        webView.navigationDelegate = context.coordinator
        let page = URLRequest(url: URL(string: url)!)
        webView.load(page)
        return webView
    }
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
    
    func makeCoordinator() -> WebViewCoordinator {
        return WebViewCoordinator {
            isLoading = true
        } didFinish: {
            isLoading = false
        }

    }
}

class WebViewCoordinator: NSObject, WKNavigationDelegate {
    var didStart: () -> Void
    var didFinish: () -> Void
    init(didStart: @escaping () -> Void = {}, didFinish: @escaping () -> Void = {}) {
        self.didStart = didStart
        self.didFinish = didFinish
    }
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        didStart()
    }
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        didFinish()
    }
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        print(error.localizedDescription)
    }
}

struct WebPage: View {
    @State private var isLoading: Bool = false
    @Environment(\.presentationMode) var presentation
    let url: String
   
    var body: some View {
        VStack {
            Button("Dismiss") {
                self.presentation.wrappedValue.dismiss()
            }
            ZStack {
                SwiftUIWebView(isLoading: $isLoading, url: url).overlay(
                    isLoading ?
                    ProgressView("Loading")
                    .progressViewStyle(CircularProgressViewStyle(tint: .gray))
                    .scaleEffect(2).toAnyView() : EmptyView().toAnyView()
                )
            }
        }
    }
    
}
struct WebPage_Previews: PreviewProvider {
    static var previews: some View {
        WebPage(url: "https://www.andrewo.net")
    }
}

