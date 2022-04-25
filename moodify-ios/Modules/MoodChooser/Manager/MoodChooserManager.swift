//
//  MoodChooserManager.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 22.04.2022.
//

import UIKit
import CoreTableView

final class MoodChooserManager {
    
    typealias MoodState = MoodChooserView.ViewState
    
    func makeUnhappyState() -> [State] {
        let moods = [
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
        let moodState = MoodState.MainMood(
            title: "unhappy".localized(using: "MoodChooser"),
            height: 324,
            moodImage: UIImage(named: "crybaby")
        ).toElement()
        let sliderState = makeMoodSlider(with: 0)
        let moodDesc = makeMoodDesc(with: "describe_mood".localized(using: "MoodChooser"))
        
        let rows = CGFloat(moods.count / 3)
        let cellWidth: CGFloat = 45
        let height = rows * cellWidth + CGFloat((moods.count / 2 - 1) * 12)
        let moodsState = MoodState.Moods(moods: moods, height: CGFloat(height)).toElement()
        
        let nextButton = makeButton(with: nil)
        let section = SectionState(header: nil, footer: nil)
        let state = [State(model: section, elements: [moodState, sliderState, moodDesc, moodsState, nextButton])]
        return state
    }
    
    private func makeMoodSlider(with position: Int) -> Element {
        let state = MoodState.MoodSlider(position: position, height: 75)
        return state.toElement()
    }
    
    private func makeMoodDesc(with desc: String) -> Element {
        let state = MoodState.MoodDescription(description: desc, height: 78)
        return state.toElement()
    }
    
    private func makeButton(with action: (() -> ())?) -> Element {
        let state = MoodState.OnNext(onSelect: nil, height: 78)
        return state.toElement()
    }
}
