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
        let section = SectionState(header: nil, footer: nil)
        let state = State(model: section, elements: [mainImageText, fullStat])
        return [state]
    }
}
