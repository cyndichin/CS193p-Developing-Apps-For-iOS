//
//  ContentView.swift
//  Memorize
//
//  Created by cynber on 5/19/21.
//

import SwiftUI

struct ContentView: View {
    @State var emojis = ["🚊", "🚞", "🚆", "🚃", "🚅", "🚂", "🚇", "🚋", "🚚", "🚛", "🛫", "🛺", "🚐", "🚜"].shuffled()
    @State var emojiCount = Int.random(in: 4..<14)
    
    var body: some View {
        VStack {
            Text("Memorize!").font(.largeTitle).bold().padding()
            ScrollView {
                LazyVGrid(columns: [GridItem(.adaptive(minimum: 65))]) {
                    ForEach(emojis[0..<emojiCount], id: \.self) { emoji in
                        CardView(content: emoji).aspectRatio(2/3, contentMode: .fit)
                    }
                }
            }
            .foregroundColor(.red)
            Spacer()
            HStack {
                theme1
                Spacer()
                theme2
                Spacer()
                theme3
            }
            .font(.largeTitle)
            .padding(.horizontal)
        }
        .padding(.horizontal)
    }
    
    var theme1: some View {
        Button {
            emojis = ["🚊", "🚞", "🚆", "🚃", "🚅", "🚂", "🚇", "🚋", "🚚", "🚛", "🛫", "🛺", "🚐", "🚜"].shuffled()
            emojiCount = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "car.fill")
                Text("Vehicles")
                    .font(.subheadline)
            }
        }
    }
    
    var theme2: some View {
        Button {
            emojis = ["🌪", "🌈", "☀️", "🌤", "⛅️", "☁️", "🌦", "🌧", "🌩", "❄️", "☃️", "🌬", "☔️", "🌫"].shuffled()
            emojiCount = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "cloud.sun.fill")
                Text("Food")
                    .font(.subheadline)
            }
        }
    }
    
    var theme3: some View {
        Button {
            emojis = ["🐶", "🐱", "🐹", "🦊", "🐰", "🐻", "🐼", "🐨", "🦁", "🐷", "🐵", "🦄", "🐣", "🐮"].shuffled()
            emojiCount = Int.random(in: 4..<emojis.count)
        } label: {
            VStack {
                Image(systemName: "tortoise.fill")
                Text("Animals")
                    .font(.subheadline)
            }
        }
    }
    
    
}

struct CardView: View {
    var content: String
    @State var isFaceUp: Bool = true
    
    var body: some View {
        ZStack {
            let shape =  RoundedRectangle(cornerRadius: 20)
            if isFaceUp {
                shape.foregroundColor(.white)
                shape.strokeBorder(lineWidth: 3)
                Text(content).font(.largeTitle)
            } else {
                shape.fill()
            }
        }.onTapGesture {
            isFaceUp = !isFaceUp
        }
    }
}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .preferredColorScheme(.dark)
        ContentView()
            .preferredColorScheme(.light)
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPhone 12 Pro Max"))
            .previewDisplayName("iPhone 12 Pro Max")
            .preferredColorScheme(.dark)
        ContentView()
            .previewDevice(PreviewDevice(rawValue: "iPad Air (4th generation)"))
            .previewDisplayName("iPad Air (4th generation)")
    }
}
