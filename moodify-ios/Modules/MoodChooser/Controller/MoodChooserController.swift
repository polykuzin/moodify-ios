//
//  MoodChooserController.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 20.04.2022.
//

import UIKit

class MoodChooserController: UIViewController {
    
    let manager = MoodChooserManager()
    let nestedView = MoodChooserView.loadFromNib()
    
    var mainMood: Float = 0
    var selectedMoods: [MoodChooserView.ViewState.Mood] = []
    
    override func loadView() {
        self.view = nestedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.manager.onMood = { [weak self] mood in
            guard let self = self else { return }
            self.selectedMoods = []
            self.mainMood = mood
            self.nestedView.configure(with: self.manager.makeMoodState(with: mood))
        }
        self.manager.onSelectMood = { [weak self] mood in
            guard let self = self else { return }
            self.selectedMoods.append(mood as! MoodChooserView.ViewState.Mood)
        }
        self.manager.onRemoveMood = { [weak self] mood in
            guard let self = self else { return }
            self.selectedMoods.removeAll { $0.title == mood.title }
        }
        self.nestedView.onNext = { [weak self] in
            guard let self = self, let navigation = self.navigationController else { return }
            let vc = MoodSaverController()
            vc.moods = self.selectedMoods
            switch Int(self.mainMood) {
            case 1:
                vc.mainMood = .unhappy
            case 2:
                vc.mainMood = .sad
            case 3:
                vc.mainMood = .normal
            case 4:
                vc.mainMood = .good
            case 5:
                vc.mainMood = .happy
            default:
                vc.mainMood = .unhappy
            }
            navigation.pushViewController(vc, animated: true)
        }
        self.nestedView.configure(with: manager.makeUnhappyState())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        MoodBar.navigation = self.navigationController
        self.tabBarController?.tabBar.isHidden = true
    }
}
