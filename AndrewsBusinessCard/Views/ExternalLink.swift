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
            let gitHubImage = Image(Constants.ImageNames.github)
            ExternalLink(image: gitHubImage, url: Constants.Websites.github)
            let linkedInImage = Image( Constants.ImageNames.linkedIn)
            ExternalLink(image: linkedInImage, url: Constants.Websites.linkedIn)
            let portfolioImage = Image(systemName:  Constants.ImageNames.portfolio)
            ExternalLink(image:portfolioImage, url: Constants.Websites.portfolio)
            let emailImage = Image(systemName: Constants.ImageNames.email)
            EMailLink(image: emailImage, email: Constants.email)
        }
    }
}
