//
//  MoodSaverManager.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 12.05.2022.
//

import UIKit
import CoreTableView

final class MoodSaverManager {
    
    typealias MoodSave = MoodSaverView.ViewState
    
    public func makeState(with moods: [_Mood]) -> MoodSave.FullState {
        let titleState = makeTitleState()
        let moodTotalState = makeMoodTotalState()
        let feelingsState = makeFeelingsState(with: moods)
        return MoodSave.FullState(titleState: titleState, tableState: [moodTotalState, feelingsState])
    }
    
    private func makeTitleState() -> MoodSave.NavigationState {
        let currentDate = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d MMM yyyy, hh:mm"
        let stringDate = dateFormatter.string(from: currentDate)
        let state = MoodSave.NavigationState(title: stringDate)
        return state
    }
    
    private func makeMoodTotalState() -> State {
        let moodTotal = MoodSave.MoodTotal(image: .init(named: "beauty_baby"), title: "You feel just okay", height: 378).toElement()
        let sectionState = SectionState(header: nil, footer: nil)
        let state = State(model: sectionState, elements: [moodTotal])
        return state
    }
    
    private func makeFeelingsState(with moods: [_Mood]) -> State {
        var height: CGFloat = 100
        if moods.count > 3 {
            let rows = CGFloat(moods.count / 3)
            let cellWidth: CGFloat = 45
            height = height + rows * cellWidth + CGFloat((moods.count / 2 - 1) * 12)
        }
        let feelings = MoodSave.Feelings(height: CGFloat(height), feelings: moods).toElement()
        let sectionState = SectionState(header: nil, footer: nil)
        let state = State(model: sectionState, elements: [feelings])
        return state
    }
}
