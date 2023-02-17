//
//  MoodConverter.swift
//  moodify-ios
//
//  Created by Andrey Rusinovich on 04.09.2022.
//

import Foundation

final class MoodConverter {
    
    private var weekdays: [String] = ["Mon", "Tue", "Wen", "Thu", "Fri", "Sat", "Sun"]
    
    func convertMoodsToWeekdayScale(moods: [Mood], maxValue: CGFloat) -> [CGFloat] {
        var moodsValues: [CGFloat] = []
        for weekday in weekdays {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEE"
            dateFormatter.locale = Locale(identifier: "En")
            if let weekdayMood = moods.filter({ mood in
                dateFormatter.string(from: mood.date!) == weekday
            }).first {
                let scale = getScale(for: weekdayMood.mood!)
                let value = scale * (maxValue / 5)
                print(value, maxValue, scale)
                moodsValues.append(value)
            } else {
                moodsValues.append(0)
            }
        }
        return moodsValues
    }
    
    private func getScale(for moodString: String) -> CGFloat {
        switch moodString {
        case "unhappy":
            return 1
        case "sad":
            return 2
        case "normal":
            return 3
        case "good":
            return 4
        case "happy":
            return 5
        default:
            return 1
        }
    }
}
