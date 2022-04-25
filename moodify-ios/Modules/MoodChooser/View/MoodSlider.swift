//
//  MoodSlider.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 26.04.2022.
//

import SwiftUI

struct MoodSlider: View {
    @State private var step: Double = 1
    
    var body: some View {
        ZStack {
            HStack {
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 4, height: 15)
                    .offset(x: 1, y: 1)
                Spacer()
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 4, height: 15)
                    .offset(x: 1, y: 1)
                Spacer()
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 4, height: 15)
                    .offset(x: 1, y: 1)
                Spacer()
                Rectangle()
                    .foregroundColor(.blue)
                    .frame(width: 4, height: 15)
                    .offset(x: 1, y: 1)
                Spacer()
                Rectangle()
                    .foregroundColor(.init(.sliderTrack))
                    .frame(width: 4, height: 15)
                    .offset(x: 1, y: 1)
            }
            Slider(value: $step, in: 1...5, step: 1)
                .accentColor(.blue)
        }
        .padding()
    }
}

struct MoodSlider_Previews: PreviewProvider {
    static var previews: some View {
        MoodSlider()
    }
}
