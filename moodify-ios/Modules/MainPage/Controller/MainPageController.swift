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
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.reloadDatabase()
        self.tabBarController?.tabBar.isHidden = false
        self.nestedView.configure(with: manager.makeMainPageState(with: moods.count))
    }
    
    private func reloadDatabase() {
        if let appDelegate = UIApplication.shared.delegate as? AppDelegate {
            let fetch: NSFetchRequest<Mood> = Mood.fetchRequest()
            do {
                let managedContext = appDelegate.persistentContainer.viewContext
                let results = try managedContext.fetch(fetch)
                moods = results
            } catch let error as NSError {
                print("Fetch error: \(error) description: \(error.userInfo)")
            }
        }
    }
}
