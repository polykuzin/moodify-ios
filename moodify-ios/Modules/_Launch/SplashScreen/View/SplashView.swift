//
//  SplashView.swift
//  moodify-ios
//
//  Created by polykuzin on 26/03/2022.
//

import UIKit

protocol _Splash {
    var dialogTitle : String { get }
    var splashTitle : String { get }
    var splashImage : UIImage { get }
}

final class SplashView : BaseView {
    
    public func configure(with data: _Splash) {
        self.dialogTitle.text = data.dialogTitle
        self.splashTitle.text = data.splashTitle
        self.splashImage.image = data.splashImage
    }
    
    @IBOutlet private weak var dialogTitle : UILabel!
    
    @IBOutlet private weak var splashTitle : UILabel!
    
    @IBOutlet private weak var splashImage : UIImageView!
}
