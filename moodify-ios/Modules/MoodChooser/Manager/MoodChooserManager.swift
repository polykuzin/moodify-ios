//
//  MoodChooserManager.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 22.04.2022.
//

import Foundation

final class MoodChooserManager {
    
    typealias MoodState = MoodChooserView.ViewState
    
    func makeSadState() -> MoodState {
        let states = [
            MoodState.Mood(title: "scared 😦"),
            MoodState.Mood(title: "disgusted 🤮"),
            MoodState.Mood(title: "lost 😦"),
            MoodState.Mood(title: "angry 😡"),
            MoodState.Mood(title: "frustrated 😖"),
            MoodState.Mood(title: "depressed 😞"),
            MoodState.Mood(title: "horryfied 🤬"),
            MoodState.Mood(title: "devastated 😭"),
            MoodState.Mood(title: "empty 😶"),
            MoodState.Mood(title: "paranoid 😱")
        ]
        return .sad(states)
    }
}
