//
//  MoodSaverController.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 12.05.2022.
//

import UIKit
import YPImagePicker

class MoodSaverController: UIViewController  {
    
    let nestedView = MoodSaverView.loadFromNib()
    let manager = MoodSaverManager()
    
    var moods: [_Mood] = []
    var photos: [UIImage] = []
    
    override func loadView() {
        self.view = nestedView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.setNavigationBarHidden(true, animated: true)
        setupView()
        self.nestedView.configure(with: manager.makeState(with: moods))
    }
    
    private func setupView() {
        self.navigationItem.hidesBackButton = true
        self.nestedView.moodBar.navigation = self.navigationController
        self.manager.onAddImage = { [weak self] in
            guard let self = self else { return }
            var config = YPImagePickerConfiguration()
            config.library.maxNumberOfItems = 5
            config.library.mediaType = .photo
            let picker = YPImagePicker(configuration: config)
            picker.didFinishPicking { [unowned picker] items, cancelled in
                for item in items {
                    switch item {
                    case .photo(let photo):
                        self.photos.append(photo.image)
                    default:
                        print(1)
                    }
                }
                picker.dismiss(animated: true, completion: nil)
                self.nestedView.configure(with: self.manager.makeState(with: self.moods, and: self.photos))
            }
            self.present(picker, animated: true)
        }
    }
}
