//
//  InfoView.swift
//  AndrewsBusinessCard
//
//  Created by Andrew Olson on 1/19/23.
//

import SwiftUI

struct InfoView: View {
    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 25)
                .frame(height: 45)
                .foregroundColor(.white)
                .shadow(radius: 5)
            ExternalLinks()
        }.padding(.all)
    }
}
