//
//  SliderCell.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 24.04.2022.
//

import UIKit
import SwiftUI
import CoreTableView

protocol _MoodSlider: CellData {
    var position: Float { get set }
    var onMood: ((Float) -> ())? { get set }
}

extension _MoodSlider {
    
    func prepare(cell: UITableViewCell, for tableView: UITableView, indexPath: IndexPath) {
        guard let cell = cell as? SliderCell else { return }
        cell.configure(with: self)
    }
    
    func cell(for tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        tableView.register(SliderCell.nib, forCellReuseIdentifier: SliderCell.identifire)
        guard let cell = tableView.dequeueReusableCell(withIdentifier: SliderCell.identifire, for: indexPath) as? SliderCell
        else { return .init() }
        return cell
    }
}

class SliderCell: UITableViewCell {

    @IBOutlet private weak var moodSlider: UISlider!
    @IBOutlet private weak var stepsStack: UIStackView!
    
    @IBOutlet weak var firstStep: UIView!
    @IBOutlet weak var secondStep: UIView!
    @IBOutlet weak var thirdStep: UIView!
    @IBOutlet weak var fourthStep: UIView!
    @IBOutlet weak var fifthStep: UIView!
    
    var onMood: ((Float) -> ())?
    
    var previousStep: Float = 1
    
    @IBAction func valueChanges(_ sender: UISlider) {
        let roundedValue = round(sender.value)
        sender.value = roundedValue
        if roundedValue != previousStep {
            self.onMood?(roundedValue)
            for i in 0..<Int(roundedValue) {
                stepsStack.arrangedSubviews[i].backgroundColor = .button
            }
            for i in Int(roundedValue)..<5 {
                stepsStack.arrangedSubviews[i].backgroundColor = .sliderTrack
            }
        }
        previousStep = roundedValue
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    public func configure(with data: _MoodSlider) {
        moodSlider.value = data.position
        previousStep = data.position
        onMood = data.onMood
    }
}
