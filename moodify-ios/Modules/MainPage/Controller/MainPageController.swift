//
//  MainPageController.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 21.05.2022.
//

import UIKit
import CoreData

class MainPageController: UIViewController {
    
    let manager = MainPageManager()
    let nestedView = MainPageView.loadFromNib()
    
    var moods: [Mood] = []
    
    override func loadView() {
        self.view = nestedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.onShowJournal = { [weak self] in
            guard let self = self, let navigation = self.navigationController else { return }
            let vc = JournalController()
            navigation.pushViewController(vc, animated: true)
        }
//        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate
//        else { return }
//        let managedContext = appDelegate.persistentContainer.viewContext
//        let mood = Mood(context: managedContext)
//
//        var dateComponents = DateComponents()
//        dateComponents.year = 2022
//        dateComponents.month = 9
//        dateComponents.day = 12
//
//        let userCalendar = Calendar(identifier: .gregorian)
//        let someDateTime = userCalendar.date(from: dateComponents)
//
//        mood.date = someDateTime
//        mood.mood = "happy"
//        mood.feelings = []
//        mood.images = []
//        appDelegate.saveContext()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadDatabase()
        MoodBar.navigation = self.navigationController
        self.tabBarController?.tabBar.isHidden = false
        self.nestedView.configure(with: manager.makeMainPageState(with: moods.count, and: moods.last?.mood))
    }
    
    private func reloadDatabase() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let fetch: NSFetchRequest<Mood> = Mood.fetchRequest()
            do {
                let managedContext = appDelegate.persistentContainer.viewContext
                let results = try managedContext.fetch(fetch)
                self.moods = results
            } catch let error as NSError {
                print("Fetch error: \(error) description: \(error.userInfo)")
            }
        }
    }
}
