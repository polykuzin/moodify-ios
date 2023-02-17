//
//  MoodSegment.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 09.10.2022.
//

import UIKit

class MoodSegment: UIView {
    
    private let currentPeriod: UIView = {
        let view = UIView()
        view.backgroundColor = .segmentActive
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    private let currentPeriodLabel = UILabel()

    @IBOutlet private weak var weekLabel: UILabel!
    @IBOutlet private weak var yearLabel: UILabel!
    @IBOutlet private weak var monthLabel: UILabel!
    @IBOutlet private weak var contentView: UIView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        loadView()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        loadView()
    }
    
    private func loadView() {
        let bundle = Bundle(for: MoodSegment.self)
        bundle.loadNibNamed("MoodSegment", owner: self, options: nil)
        self.addSubview(contentView)
        self.contentView.frame = self.bounds
        self.contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.contentView.layer.cornerRadius = 10
        let tapWeek = UITapGestureRecognizer(target: self, action: #selector(weekTapped))
        self.weekLabel.addGestureRecognizer(tapWeek)
        let tapMonth = UITapGestureRecognizer(target: self, action: #selector(monthTapped))
        self.monthLabel.addGestureRecognizer(tapMonth)
        let tapYear = UITapGestureRecognizer(target: self, action: #selector(yearTapped))
        self.yearLabel.addGestureRecognizer(tapYear)
        self.currentPeriod.layer.cornerRadius = 10
        self.currentPeriod.layer.shadowRadius = 4
        self.currentPeriod.layer.shadowOpacity = 0.25
        self.currentPeriod.layer.shadowColor = UIColor.black.cgColor
        self.currentPeriod.layer.shadowOffset = CGSize(width: 0, height: 4)
        self.currentPeriod.frame.size.width = self.weekLabel.frame.width - 7
        self.currentPeriod.frame.size.height = self.weekLabel.frame.height - 7
        self.currentPeriod.center = self.weekLabel.center
        self.currentPeriodLabel.text = "Week"
        self.currentPeriodLabel.textAlignment = .center
        self.currentPeriodLabel.textColor = .segmentText
        self.currentPeriodLabel.font = .systemFont(ofSize: 18, weight: .semibold)
        self.currentPeriodLabel.frame = currentPeriod.bounds
        self.currentPeriod.addSubview(currentPeriodLabel)
        self.contentView.addSubview(currentPeriod)
    }
    
    @objc private func weekTapped() {
        let width = self.weekLabel.frame.width - 7
        let height = self.weekLabel.frame.height - 7
        UIView.animate(withDuration: 0.2) {
            self.currentPeriod.frame.size.width = width
            self.currentPeriod.frame.size.height = height
            self.currentPeriod.center = self.weekLabel.center
            self.currentPeriodLabel.text = "Week"
            self.currentPeriodLabel.center = CGPoint(x: self.currentPeriod.frame.width / 2, y: self.currentPeriod.frame.height / 2)
            self.layoutIfNeeded()
        }
    }
    
    @objc private func monthTapped() {
        let width = self.monthLabel.frame.width - 7
        let height = self.monthLabel.frame.height - 7
        UIView.animate(withDuration: 0.2) {
            self.currentPeriod.frame.size.width = width
            self.currentPeriod.frame.size.height = height
            self.currentPeriod.center = self.monthLabel.center
            self.currentPeriodLabel.text = "Month"
            self.currentPeriodLabel.center = CGPoint(x: self.currentPeriod.frame.width / 2, y: self.currentPeriod.frame.height / 2)
            self.layoutIfNeeded()
        }
    }
    
    @objc private func yearTapped() {
        let width = self.yearLabel.frame.width - 7
        let height = self.yearLabel.frame.height - 7
        UIView.animate(withDuration: 0.2) {
            self.currentPeriod.frame.size.width = width
            self.currentPeriod.frame.size.height = height
            self.currentPeriod.center = self.yearLabel.center
            self.currentPeriodLabel.text = "Year"
            self.currentPeriodLabel.center = CGPoint(x: self.currentPeriod.frame.width / 2, y: self.currentPeriod.frame.height / 2)
            self.layoutIfNeeded()
        }
    }
}
