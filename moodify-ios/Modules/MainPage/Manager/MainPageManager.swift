//
//  MainPageManager.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 21.05.2022.
//

import CoreTableView

final class MainPageManager {
    
    typealias MainPageState = MainPageView.ViewState
    
    public func makeMainPageState() -> [State] {
        let mainImageText = MainPageState.MainImageText().toElement()
        let fullStat = MainPageState.FullStat(onSelect: { print(1) }).toElement()
        let journal = MainPageState.Journal().toElement()
        let motivation = MainPageState.DailyMotivation(text: "Perhaps all anxiety might derive from a fixation on moments - an inability to acept life as ongoing.", author: "Sarah Manguso").toElement()
        let section = SectionState(header: nil, footer: nil)
        let state = State(model: section, elements: [mainImageText, fullStat, journal, motivation])
        return [state]
    }
}
