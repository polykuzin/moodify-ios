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
    
    var onMood: ((Float) -> ())?
    
    public func makeUnhappyState() -> [State] {
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
        let sliderState = makeMoodSlider(with: 1)
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
    
    public func makeSadState() -> [State] {
        let moods = [
            MoodState.Mood(title: "sentimental 😢"),
            MoodState.Mood(title: "envious 😒"),
            MoodState.Mood(title: "confused 🤨"),
            MoodState.Mood(title: "nostalgic 😐"),
            MoodState.Mood(title: "bored 😑"),
            MoodState.Mood(title: "miserable 😥"),
            MoodState.Mood(title: "painful 😣"),
            MoodState.Mood(title: "lonely 😢"),
            MoodState.Mood(title: "anxious 😟"),
            MoodState.Mood(title: "paranoid 😱")
        ]
        let moodState = MoodState.MainMood(
            title: "sad".localized(using: "MoodChooser"),
            height: 324,
            moodImage: UIImage(named: "sadbaby")
        ).toElement()
        let sliderState = makeMoodSlider(with: 2)
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
    
    public func makeNormalState() -> [State] {
        let moods = [
            MoodState.Mood(title: "sentimental 😢"),
            MoodState.Mood(title: "envious 😒"),
            MoodState.Mood(title: "confused 🤨"),
            MoodState.Mood(title: "nostalgic 😐"),
            MoodState.Mood(title: "bored 😑"),
            MoodState.Mood(title: "miserable 😥"),
            MoodState.Mood(title: "painful 😣"),
            MoodState.Mood(title: "lonely 😢"),
            MoodState.Mood(title: "anxious 😟"),
            MoodState.Mood(title: "paranoid 😱")
        ]
        let moodState = MoodState.MainMood(
            title: "normal".localized(using: "MoodChooser"),
            height: 324,
            moodImage: UIImage(named: "normalbaby")
        ).toElement()
        let sliderState = makeMoodSlider(with: 3)
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
    
    public func makeGoodState() -> [State] {
        let moods = [
            MoodState.Mood(title: "sentimental 😢"),
            MoodState.Mood(title: "envious 😒"),
            MoodState.Mood(title: "confused 🤨"),
            MoodState.Mood(title: "nostalgic 😐"),
            MoodState.Mood(title: "bored 😑"),
            MoodState.Mood(title: "miserable 😥"),
            MoodState.Mood(title: "painful 😣"),
            MoodState.Mood(title: "lonely 😢"),
            MoodState.Mood(title: "anxious 😟"),
            MoodState.Mood(title: "paranoid 😱")
        ]
        let moodState = MoodState.MainMood(
            title: "good".localized(using: "MoodChooser"),
            height: 324,
            moodImage: UIImage(named: "goodbaby")
        ).toElement()
        let sliderState = makeMoodSlider(with: 4)
        let moodDesc = makeMoodDesc(with: "describe_mood".localized(using: "MoodChooser"))
        
        let rows = CGFloat(moods.count / 4)
        let cellWidth: CGFloat = 45
        let height = rows * cellWidth + CGFloat((moods.count / 2 - 1) * 12)
        let moodsState = MoodState.Moods(moods: moods, height: CGFloat(height)).toElement()
        
        let nextButton = makeButton(with: nil)
        let section = SectionState(header: nil, footer: nil)
        let state = [State(model: section, elements: [moodState, sliderState, moodDesc, moodsState, nextButton])]
        return state
    }
    
    public func makeHappyState() -> [State] {
        let moods = [
            MoodState.Mood(title: "sentimental 😢"),
            MoodState.Mood(title: "envious 😒"),
            MoodState.Mood(title: "confused 🤨"),
            MoodState.Mood(title: "nostalgic 😐"),
            MoodState.Mood(title: "bored 😑"),
            MoodState.Mood(title: "miserable 😥"),
            MoodState.Mood(title: "painful 😣"),
            MoodState.Mood(title: "lonely 😢"),
            MoodState.Mood(title: "anxious 😟"),
            MoodState.Mood(title: "paranoid 😱")
        ]
        let moodState = MoodState.MainMood(
            title: "happy".localized(using: "MoodChooser"),
            height: 324,
            moodImage: UIImage(named: "happybaby")
        ).toElement()
        let sliderState = makeMoodSlider(with: 5)
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
    
    public func makeMoodState(with mood: Float) -> [State] {
        switch mood {
        case 1:
            return makeUnhappyState()
        case 2:
            return makeSadState()
        case 3:
            return makeNormalState()
        case 4:
            return makeGoodState()
        case 5:
            return makeHappyState()
        default:
            return makeUnhappyState()
        }
    }
    
    private func makeMoodSlider(with position: Float) -> Element {
        let state = MoodState.MoodSlider(position: position, height: 75, onMood: onMood)
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
