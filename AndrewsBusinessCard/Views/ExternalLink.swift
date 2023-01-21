//
//  ExternalLink.swift
//  AndrewsBusinessCard
//
//  Created by Andrew Olson on 1/19/23.
//

import SwiftUI


struct ExternalLink: View {
    @State private var showingSheet = false
    let image: Image
    let url: String
    var body: some View {
        Button {
            showingSheet.toggle()
        }
        label: {
            image.resizable()
            .frame(width: 25, height: 25)
            .foregroundColor(.teal)
        }
        .sheet(isPresented: $showingSheet, content: {
            WebPage(url: url)
        })
        .padding(.all)
    }
}

struct EMailLink: View {
    
    let image: Image
    let email: String
    var body: some View {
        Button {
            openMail()
        }
        label: {
            image.resizable()
            .frame(width: 25, height: 25)
            .foregroundColor(.teal)
        }
        .padding(.all)
    }
    func openMail() {
        let url = URL(string: "mailto://arolson56@gmail.com")
            if let url = url {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }
    }
}

struct ExternalLinks: View {
    
    var body: some View {
        HStack {
            let gitHubImage = Image("github")
            ExternalLink(image: gitHubImage, url: "https://www.github.com/arolson")
            let linkedInImage = Image("LinkedIn")
            ExternalLink(image: linkedInImage, url: "https://linkedin.com/in/Andrew-R-Olson")
            let portfolioImage = Image(systemName: "folder.fill.badge.person.crop")
            ExternalLink(image:portfolioImage, url: "https://www.andrewo.net")
            let emailImage = Image(systemName: "envelope.fill")
            EMailLink(image: emailImage, email: "arolson56@gmail.com")
        }
    }
}
