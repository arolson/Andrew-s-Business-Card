//
//  ContentView.swift
//  AndrewsBusinessCard
//
//  Created by Andrew Olson on 1/19/23.
//

import SwiftUI




struct ContentView: View {
    let rectangle = RoundedRectangle(cornerRadius: 25, style: .continuous)
    var body: some View {
        ZStack {
            Color(.systemTeal).edgesIgnoringSafeArea(.all)
            VStack {
                Image("myPhoto")
                .resizable()
                .frame(width: 250, height: 250)
                .aspectRatio(contentMode: .fit)
                .clipShape(rectangle)
                .shadow(radius: 20)
                .overlay(rectangle.stroke(Color.white, lineWidth: 5))
                Text("Andrew Olson")
                .font(.custom("",size: 50))
                .foregroundColor(.white)
                Text("iOS Developer")
                .font(.custom("Slabo27px-Regular",size: 30))
                .foregroundColor(.white)
                Divider()
                InfoView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


