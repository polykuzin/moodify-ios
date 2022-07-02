//
//  JournalManager.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 02.07.2022.
//

import CoreTableView

final class JournalManager {
    
    typealias JournalState = JournalView.ViewState
    
    public func makeState() -> [State] {
        let distribution = makeDistributionState()
        return [distribution]
    }
    
    private func makeDistributionState() -> State {
        let distributionHeader = JournalState.DistributionHeader(
            title: "distribution_title".localized(using: "Journal"),
            description: "distribution_descr".localized(using: "Journal")
        )
        let distributions = [
            JournalState.MoodStat(image: .init(named: "normalbaby"), title: "NORMAL", distribution: 42),
            JournalState.MoodStat(image: .init(named: "normalbaby"), title: "NORMAL", distribution: 42),
            JournalState.MoodStat(image: .init(named: "normalbaby"), title: "NORMAL", distribution: 42),
            JournalState.MoodStat(image: .init(named: "normalbaby"), title: "NORMAL", distribution: 42),
            JournalState.MoodStat(image: .init(named: "normalbaby"), title: "NORMAL", distribution: 42)
        ]
        let distState = JournalState.Distribution(distributions: distributions).toElement()
        let section = SectionState(header: distributionHeader, footer: nil)
        let state = State(model: section, elements: [distState])
        return state
    }
}
