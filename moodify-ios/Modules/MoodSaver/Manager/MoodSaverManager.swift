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
    
    var onAddImage: (() -> ())?
    
    public func makeState(with moods: [_Mood], and photos: [UIImage] = []) -> MoodSave.FullState {
        let titleState = makeTitleState()
        let moodTotalState = makeMoodTotalState()
        let feelingsState = makeFeelingsState(with: moods)
        let photosState = makePhotosState(with: photos)
        return MoodSave.FullState(titleState: titleState, tableState: [moodTotalState, feelingsState, photosState])
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
            let rows = ceil(CGFloat(moods.count) / 3)
            height = height + rows * 21 + (rows - 1) * 14
        }
        let feelings = MoodSave.Feelings(height: CGFloat(height), feelings: moods).toElement()
        let sectionState = SectionState(header: nil, footer: nil)
        let state = State(model: sectionState, elements: [feelings])
        return state
    }
    
    private func makePhotosState(with photos: [UIImage]) -> State {
        let photos = MoodSave.Photos(height: 180, photos: photos, addImage: onAddImage).toElement()
        let sectionState = SectionState(header: nil, footer: nil)
        let state = State(model: sectionState, elements: [photos])
        return state
    }
}
