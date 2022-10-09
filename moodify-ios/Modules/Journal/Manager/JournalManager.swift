//
//  JournalManager.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 02.07.2022.
//

import UIKit
import CoreData
import CoreTableView

final class JournalManager {
    
    typealias JournalState = JournalView.ViewState
    typealias MoodType = MoodChooserView.ViewState.MoodType
    
    public func makeState() -> [State] {
        let distribution = makeDistributionState()
        let average = makeAverageState()
        return [distribution, average]
    }
    
    private func makeDistributionState() -> State {
        let distributionHeader = JournalState.JournalHeader(
            title: "distribution_title".localized(using: "Journal"),
            description: "distribution_descr".localized(using: "Journal")
        )
        let savedMoods = loadSavedMoods()
        var dists: [Int] = [0, 0, 0, 0, 0]
        if savedMoods.count != 0 {
            for i in 0...4 {
                let dist = savedMoods.filter({ ($0.mood ?? "") == MoodType.allCases[i].rawValue }).count * 100 / savedMoods.count
                dists[i] = dist
            }
        }
        let distributions = [
            JournalState.MoodStat(image: .init(named: "unhappybaby"), title: "UNHAPPY", distribution: dists[0]),
            JournalState.MoodStat(image: .init(named: "sadbaby"), title: "SAD", distribution:  dists[1]),
            JournalState.MoodStat(image: .init(named: "normalbaby"), title: "NORMAL", distribution:  dists[2]),
            JournalState.MoodStat(image: .init(named: "goodbaby"), title: "GOOD", distribution:  dists[3]),
            JournalState.MoodStat(image: .init(named: "happybaby"), title: "HAPPY", distribution:  dists[4])
        ]
        let distState = JournalState.Distribution(distributions: distributions).toElement()
        let section = SectionState(header: distributionHeader, footer: nil)
        let state = State(model: section, elements: [distState])
        return state
    }
    
    private func makeAverageState() -> State {
        let averageHeader = JournalState.JournalHeader(
            title: "average_title".localized(using: "Journal"),
            description: "average_descr".localized(using: "Journal")
        )
        let moods = loadSavedMoods()
        let moodChart = JournalState.MoodChart(moods: moods).toElement()
        let section = SectionState(header: averageHeader, footer: nil)
        let state = State(model: section, elements: [moodChart])
        return state
    }
    
    private func loadSavedMoods() -> [Mood] {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let fetch: NSFetchRequest<Mood> = Mood.fetchRequest()
            do {
                let managedContext = appDelegate.persistentContainer.viewContext
                let results = try managedContext.fetch(fetch)
                return results
            } catch let error as NSError {
                print("Fetch error: \(error) description: \(error.userInfo)")
            }
        }
        return []
    }
}
