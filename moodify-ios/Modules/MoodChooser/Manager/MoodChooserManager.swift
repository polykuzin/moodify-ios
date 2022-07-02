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
    var onSelectMood: ((_Mood) -> ())?
    var onRemoveMood: ((_Mood) -> ())?
    
    public func makeUnhappyState() -> [State] {
        let moods = MoodService.unhappyMoods
        let mainMoodState = makeMainMood(with: "unhappy", and: "unhappybaby")
        let sliderState = makeMoodSlider(with: 1)
        let moodDesc = makeMoodDesc(with: "Which words describe your feelings best?")
        let moodsState = makeMoods(with: moods)
        
        let section = SectionState(header: nil, footer: nil)
        let state = [State(model: section, elements: [mainMoodState, sliderState, moodDesc, moodsState])]
        return state
    }
    
    public func makeSadState() -> [State] {
        let moods = MoodService.sadMoods
        let mainMoodState = makeMainMood(with: "sad", and: "sadbaby")
        let sliderState = makeMoodSlider(with: 2)
        let moodDesc = makeMoodDesc(with: "Which words describe your feelings best?".localized(using: "MoodChooser"))
        let moodsState = makeMoods(with: moods)
        
        let section = SectionState(header: nil, footer: nil)
        let state = [State(model: section, elements: [mainMoodState, sliderState, moodDesc, moodsState])]
        return state
    }
    
    public func makeNormalState() -> [State] {
        let moods = MoodService.normalMoods
        let mainMoodState = makeMainMood(with: "normal", and: "normalbaby")
        let sliderState = makeMoodSlider(with: 3)
        let moodDesc = makeMoodDesc(with: "Which words describe your feelings best?")
        let moodsState = makeMoods(with: moods)
        
        let section = SectionState(header: nil, footer: nil)
        let state = [State(model: section, elements: [mainMoodState, sliderState, moodDesc, moodsState])]
        return state
    }
    
    public func makeGoodState() -> [State] {
        let moods = MoodService.goodMoods
        let mainMoodState = makeMainMood(with: "good", and: "goodbaby")
        let sliderState = makeMoodSlider(with: 4)
        let moodDesc = makeMoodDesc(with: "Which words describe your feelings best?")
        let moodsState = makeMoods(with: moods)
        
        let section = SectionState(header: nil, footer: nil)
        let state = [State(model: section, elements: [mainMoodState, sliderState, moodDesc, moodsState])]
        return state
    }
    
    public func makeHappyState() -> [State] {
        let moods = MoodService.happyMoods
        let moodState = makeMainMood(with: "happy", and: "happybaby")
        let sliderState = makeMoodSlider(with: 5)
        let moodDesc = makeMoodDesc(with: "Which words describe your feelings best?")
        let moodsState = makeMoods(with: moods)
        
        let section = SectionState(header: nil, footer: nil)
        let state = [State(model: section, elements: [moodState, sliderState, moodDesc, moodsState])]
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
    
    private func makeMainMood(with title: String, and image: String) -> Element {
        let moodState = MoodState.MainMood(
            title: title.localized(using: "MoodChooser"),
            height: 324,
            moodImage: UIImage(named: image)
        ).toElement()
        return moodState
    }
    
    private func makeMoods(with moods: [_Mood]) -> Element {
        let rows = CGFloat(moods.count / 3) + 1
        let height = rows * 37 + CGFloat((moods.count / 3) * 15) 
        let moodsState = MoodState.Moods(
            moods: moods,
            onSelectMood: { [weak self] mood in
                self?.onSelectMood?(mood)
            },
            onRemoveMood: { [weak self] mood in
                self?.onRemoveMood?(mood)
            },
            height: CGFloat(height)
        ).toElement()
        return moodsState
    }
    
    private func makeMoodSlider(with position: Float) -> Element {
        let state = MoodState.MoodSlider(position: position, height: 75, onMood: onMood)
        return state.toElement()
    }
    
    private func makeMoodDesc(with desc: String) -> Element {
        let state = MoodState.MoodDescription(description: desc, height: 78)
        return state.toElement()
    }
}
