//
//  MoodChooserController.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 20.04.2022.
//

import UIKit

class MoodChooserController: UIViewController {
    
    let nestedView = MoodChooserView.loadFromNib()
    
    var selectedMoods: [MoodChooserView.ViewState.Mood] = []
    
    override func loadView() {
        self.view = nestedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        let manager = MoodChooserManager()
        manager.onMood = { [weak self] mood in
            self?.selectedMoods = []
            self?.nestedView.configure(with: manager.makeMoodState(with: mood))
        }
        manager.onSelectMood = { [weak self] mood in
            self?.selectedMoods.append(mood as! MoodChooserView.ViewState.Mood)
        }
        manager.onRemoveMood = { [weak self] mood in
            self?.selectedMoods.removeAll { $0.title == mood.title }
        }
        nestedView.onNext = { [weak self] in
            guard let self = self,
                  let navigation = self.navigationController
            else { return }
            let vc = MoodSaverController()
            vc.moods = self.selectedMoods
            navigation.pushViewController(vc, animated: true)
        }
        self.nestedView.configure(with: manager.makeUnhappyState())
    }
}
